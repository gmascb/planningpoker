class PokersController < ApplicationController
  before_action :set_poker, only: [:show, :edit, :update, :destroy]

  # GET /pokers
  # GET /pokers.json
  def index
      
    disable_gc
    
  end

  # GET /pokers/1
  # GET /pokers/1.json
  def show
  end

  # GET /pokers/new
  def new
    
    @poker = Poker.new
    @salaAtual = params[:sala]
    @jogando = 1
    @sala = Room.find(@salaAtual)
    @cartarepetida= params[:cartarepetida]
    
    if current_user
      @minhaCarta = Poker.where(user: current_user.name).where(room: @salaAtual).first
      if @minhaCarta != nil
        if @minhaCarta.value != nil
          @minhaCarta = @minhaCarta.value
        else
          @minhaCarta = @minhaCarta.name
        end
      end
    end
    
    validarPermissao
    
  end

  # GET /pokers/1/edit
  def edit
    check_user
  end

  # POST /pokers
  # POST /pokers.json
  def create
    @salaAtual = params[:sala]
    @sala = Room.find(params[:sala])
    @poker = Poker.new(poker_params)

    valor = @poker.value || 0
    nome = @poker.name
    
    if (@poker.name && @poker.name.size > 0)
      @poker.value = 0
    end

    if current_user != nil
      qtdCartasDoUsuario = Poker.where(user: current_user.name).where(room: @salaAtual).size     
      if (qtdCartasDoUsuario >= 1)
        @poker = Poker.where(user: current_user.name).where(room: @salaAtual).first
        @poker.name = nome
        @poker.value = valor
        @cartaAtualizada = 1
      else
        @poker = Poker.new(poker_params)
      end
    else
      @poker.user == 'Sem Usuario'
    end

    if (@cartaAtualizada && @sala.bloqcartarepet && @sala.players <= Poker.where(room: @salaAtual).size && @sala.players > 0)
      @cartaAtualizada = -1
      redirect_to new_poker_path(sala: @salaAtual, cartarepetida: @cartaAtualizada )
    else
      respond_to do |format|
        if @poker.save
          format.html { redirect_to new_poker_path(sala: @salaAtual, cartarepetida: @cartaAtualizada), notice: 'CartaOk' }
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
    
    validarPermissao

    if (@apaga)
      if (params[:apagouPorFora])
        Poker.where(room: @sala.id).destroy_all
        redirect_to rooms_path
      else
        Poker.where(room: @sala.id).destroy_all
        redirect_to pokers_path(sala: @sala.id)
      end
    end
  end 
  

  private
  
  def validarPermissao
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
  
  def disable_gc
    GC.disable
    begin
      indexGC
    ensure
      GC.enable
      GC.start
    end
  end
  
  
  
  def indexGC
    
    if params.has_key?(:sala)
      
      @sala = Room.find(params[:sala])
      @pokers = Poker.where(room: @sala.id)
      @chartdataValue = Poker.where(room: @sala).where("VALUE > 0").group(:value).count.sort
      
      @mostraBotaoRefresh = !@sala.refreshauto
      
      if @sala.playersname != nil
        @playersRoom = @sala.playersname.split(", ")

        @playersRoom.each do |jogador|
          jogador = jogador.strip
        end
      end

      @QuemJaJogou = Array.new
      @pokers.each do |carta|
        @QuemJaJogou << carta.user
      end
      
      if @players == nil
        @players = 0
      end
      
    else
      # se estiver sem parametro volta para tela de salas.
      redirect_to rooms_path
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