class PokersController < ApplicationController
  before_action :set_poker, only: [:show, :edit, :update, :destroy]
  
  # GET /pokers
  # GET /pokers.json
  def index
    @pokers = Poker.where(room: params[:sala])
    
    if params.has_key?(:sala)
      @sala = Room.find(params[:sala]).id
      @sala_nome = Room.find(params[:sala]).name
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
    @cartarepetida= params[:cartarepetida]
  end

  # GET /pokers/1/edit
  def edit
  end

  # POST /pokers
  # POST /pokers.json
  def create
    @poker = Poker.new(poker_params)
    @salaAtual = params[:sala]

    if @poker.name == 'Pausa'
      valor = @poker.name
    elsif @poker.name == 'Nao Entendi'
      valor = @poker.name
    else
      valor = @poker.value
    end
    
    if current_user
      qtdCartasDoUsuario = Poker.where(user: current_user.name).size
      if (qtdCartasDoUsuario >= 1)
        @poker.user = 'usuarioRepetido'
        @cartarepetida = 1
      end
    end
  
    respond_to do |format|
      if @poker.save

        format.html { 
          redirect_to new_poker_path(sala: @salaAtual, cartarepetida: @cartarepetida), notice: 'CartaOk' 
        }

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
      format.html { redirect_to pokers_path(sala: @salaAtual), notice: 'Reinicilização realizada!' }
      format.json { head :no_content }
    end
  end 


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poker
      @poker = Poker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poker_params
      params.require(:poker).permit(:name, :value, :user, :room)
    end
end