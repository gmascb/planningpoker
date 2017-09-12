class PokersController < ApplicationController
  before_action :set_poker, only: [:show, :edit, :update, :destroy]

  # GET /pokers
  # GET /pokers.json
  def index
    
    if params.has_key?(:sala)
      #region Variaveis para Index.Html
      @sala = Room.find(params[:sala])
      @pokers = Poker.where(room: params[:sala])
      #endregion
      
      @players = Room.find(params[:sala]).players #usa no Client e Server
      
      if @players == nil
        @players = 0
      end
      
    else
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
    @salaAtual = params[:sala]
    @sala = Room.find(@salaAtual)
    @cartarepetida= params[:cartarepetida]
    
    #(!@sala.playersname.nil? || !@sala.playersname.empty?)
    
    if(current_user) #estou logado
      if (@sala.user) #alguem logado criou a sala
        if(current_user.name != @sala.user) #nao criei a sala
          if(!@sala.playersname.empty?) #tem nome dos jogadores
            if (!@sala.playersname.include? current_user.name) # Meu Nome nao esta na lista
              redirect_to rooms_path, notice: 'Voce não está na lista de jogadores desta sala' #sai da sala
            end
          end
        end
      end
    else #nao estou logado
      if (@sala.user != nil) #Sala criada Sem Login
        redirect_to rooms_path, notice: 'Voce precisa efetuar o login' #sai da sala
      end
    end
    
    
    
  end

  # GET /pokers/1/edit
  def edit
    check_user
  end

  # POST /pokers
  # POST /pokers.json
  def create
    @salaAtual = params[:sala]
    @poker = Poker.new(poker_params)

    valor = @poker.value
    nome = @poker.name

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
    @salaAtual = params[:sala]
    Poker.where(room: params[:sala]).destroy_all
    respond_to do |format|
      format.html { redirect_to pokers_path(sala: @salaAtual) }
      format.json { head :no_content }
    end
  end 


  private
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