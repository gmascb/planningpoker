class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    check_user
  end

  # GET /rooms/new
  def new
    @room = Room.new
    @room.bloqcartarepet = true
    @room.refreshauto = true
  end

  # GET /rooms/1/edit
  def edit
    room = Room.find(params[:id])
    if (current_user != nil && room.user != nil)
      check_user
    end
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    
    if (current_user != nil)
      @room.user = current_user.name
    end
    
    respond_to do |format|
      if @room.save
        format.html { redirect_to rooms_path, notice: "Sala '" + @room.name + "' criada com sucesso!" }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to rooms_path, notice: "Sala '" + @room.name + "' atualizada com sucesso!" }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    #Ao apagar uma sala, suas cartas devem ser apagadas.
    Poker.where(room: @room).destroy_all
    
    @room.destroy
    
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Sala '" + @room.name + "' foi apagada com sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, :players, :user, :playersname, :refreshauto, :bloqcartarepet, :selectuser)
    end
end
