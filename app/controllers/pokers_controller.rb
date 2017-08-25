class PokersController < ApplicationController
  before_action :set_poker, only: [:show, :edit, :update, :destroy]

  # GET /pokers
  # GET /pokers.json
  def index
    if params.has_key?(:sala)
      @sala = Room.find(params[:sala]).id
      @sala_nome = Room.find(params[:sala]).name
      @pokers = Poker.where(room: params[:sala])
      @players = Room.find(params[:sala]).players
      
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
    check_user
    @poker = Poker.new
    @salaAtual = params[:sala]
    @cartarepetida= params[:cartarepetida]
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

    if current_user.name != nil
      qtdCartasDoUsuario = Poker.where(user: current_user.name).where(room: @salaAtual).size     
      if (qtdCartasDoUsuario >= 1)
        @poker = Poker.where(user: current_user.name).where(room: @salaAtual).first
        @poker.name = nome
        @poker.value = valor
        @cartarepetida = 1
      else
        @poker = Poker.new(poker_params)
      end
    end

    respond_to do |format|
      if @poker.save
        format.html { redirect_to new_poker_path(sala: @salaAtual, cartarepetida: @cartarepetida), notice: 'CartaOk' }
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