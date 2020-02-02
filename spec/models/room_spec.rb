require 'rails_helper'

RSpec.describe Room, type: :model do

  before(:each) do
    @room = Room.new(name: "Nome da sala", players: 5, playersname: "Joao, Maria")
  end

  context "Validando dados da sala" do
  
    it "Sala é valida se name, players e playersname estiverem preenchidos" do
      
      #arrange with before(:each)

      #act
      result = @room.valid?

      #assert
      expect(result).to be_truthy
    
    end

    it "Sala é inválida se name não estiver preenchido" do
      
      #arrange with before(:each)
      @room.name = nil

      #act
      result = @room.valid?

      #assert
      expect(result).to be_falsey
    
    end 
    
    it "Sala é inválida se players não estiver preenchido" do
      
      #arrange
      @room.players = nil

      #act
      result = @room.valid?

      #assert
      expect(result).to be_falsey

    end
    
    it "Sala é inválida se playersname possuir caracter diferente de a-z e A-Z e âÂêÊîÎôÔûÛïÏõÕôÔãÃÜüçÇàèìòùÀÈÌÒÙáéíóúÁÉÍÓÚ" do

      #arrange
      @room.playersname = "'"

      #act
      result = @room.valid?

      #assert
      expect(result).to be_falsey

    end

  end
end
