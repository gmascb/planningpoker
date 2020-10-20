class PokersController < ApplicationController
  before_action :set_poker, only: [:show, :edit, :update, :destroy]

  # GET /pokers
  # GET /pokers.json
  def index
    if params.has_key?(:sala)
      
      @sala = Room.find(params[:sala])
      @pokers = Poker.where(room: @sala.id)
      @chart_data_value = Poker.by_room(@sala.id).group(:value).count.sort
      
      if @sala.playersname != nil
        @players_room = @sala.playersname.split(", ")

        @players_room.each do |jogador|
          jogador = jogador.strip
        end
      end

      @quem_ja_jogou = Array.new
      @pokers.each do |carta|
        @quem_ja_jogou << carta.user
      end
      
      if @players == nil
        @players = 0
      end
      
    else
      # se estiver sem parametro volta para tela de salas.
      redirect_to rooms_path
    end
    
  end

  # GET /pokers/1
  # GET /pokers/1.json
  def show
  end

  # GET /pokers/new
  def new
    
    @poker = Poker.new
    @sala_atual = params[:sala]
    @jogando = 1
    @sala = Room.find(@sala_atual)
    @cartarepetida= params[:cartarepetida]
    
    if current_user
      @minha_carta = Poker.where(user: current_user.name).where(room: @sala_atual).first
      if @minha_carta != nil
        if @minha_carta.value != nil
          @minha_carta = @minha_carta.value
        else
          @minha_carta = @minha_carta.name
        end
      end
    end
    
    validar_permissao
    
  end

  # GET /pokers/1/edit
  def edit
    check_user
  end

  # POST /pokers
  # POST /pokers.json
  def create
    @sala_atual = params[:sala]
    @sala = Room.find(params[:sala])
    @poker = Poker.new(poker_params)

    valor = @poker.value || 0
    nome = @poker.name
    
    if (@poker.name && @poker.name.size > 0)
      @poker.value = 0
    end

    if current_user != nil
      qtd_cartas_do_usuario = Poker.where(user: current_user.name).where(room: @sala_atual).size     
      if (qtd_cartas_do_usuario >= 1)
        @poker = Poker.where(user: current_user.name).where(room: @sala_atual).first
        @poker.name = nome
        @poker.value = valor
        @carta_atualizada = 1
      else
        @poker = Poker.new(poker_params)
      end
    else
      @poker.user == 'Sem Usuario'
    end

    if (@carta_atualizada && @sala.bloqcartarepet && @sala.players <= Poker.where(room: @sala_atual).size && @sala.players > 0)
      @carta_atualizada = -1
      redirect_to new_poker_path(sala: @sala_atual, cartarepetida: @carta_atualizada )
    else
      respond_to do |format|
        if @poker.save
          format.html { redirect_to new_poker_path(sala: @sala_atual, cartarepetida: @carta_atualizada), notice: 'CartaOk' }
          format.json { render :show, status: :created, location: @poker }
        else
          format.html { render :new }
          format.json { render json: @poker.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  
  # PATCH/PUT /pokers/1
  # PATCH/PUT /pokers/1.json
  def update
    respond_to do |format|
      if @poker.update(poker_params)
        format.html { redirect_to @poker, notice: 'Poker was successfully updated.' }
        format.json { render :show, status: :ok, location: @poker }
      else
        format.html { render :edit }
        format.json { render json: @poker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokers/1
  # DELETE /pokers/1.json
  def destroy
    @apaga = true
    @sala = Room.find(params[:sala])
    
    validar_permissao

    if @apaga
      if params[:apagou_por_fora]
        Poker.where(room: @sala.id).destroy_all
        redirect_to rooms_path
      else
        Poker.where(room: @sala.id).destroy_all
        redirect_to pokers_path(sala: @sala.id)
      end
    end
  end 
  

  private
  
  def validar_permissao
    if(current_user) #estou logado
      if (@sala.user) #alguem logado criou a sala
        if(!@sala.user.include?current_user.name) #nao criei a sala / não sou responsável
          if(@sala.playersname != nil && !@sala.playersname.empty?) #tem nome dos jogadores
            if (!@sala.playersname.to_s.force_encoding("UTF-8").include? current_user.name.to_s.force_encoding("UTF-8")) # Meu Nome nao esta na lista
              redirect_to rooms_path, notice: 'Voce não está na lista de jogadores desta sala' #sai da sala
              @apaga = false
            end
          end
        end
      end
    else #nao estou logado
      if (@sala.user != nil) #Sala criada Sem Login
        redirect_to rooms_path, notice: 'Voce precisa efetuar o login' #sai da sala
        @apaga = false
      end
    end
  end
  
  
  # Use callbacks to share common setup or constraints between actions.
  def set_poker
    begin
      @poker = Poker.find(params[:id])
    rescue
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def poker_params
    params.require(:poker).permit(:name, :value, :user, :room)
  end
end