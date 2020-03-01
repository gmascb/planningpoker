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

    it "Exercicio 1 - Find Duplicates" do

      #arrange
      array = [1, 2, 4, 4, 3, 3, 1, 5, 3, '5']

      #act
      result = ApplicationHelper.find_duplicates(array)
      
      #assert
      expect(result).to eq [1,4,3]

    end


    it "Exercicio 2 - Count Duplicates" do

      #arrange
      obj = "indivisibility"

      #act
      result = ApplicationHelper.count_duplicates(obj)
      
      #assert
      expect(result).to be == 1

    end

    it "Exercicio 2 - Count Duplicates teste 2" do

      #arrange
      obj = "Indivisibilities"

      #act
      result = ApplicationHelper.count_duplicates(obj)
      
      #assert
      expect(result).to be == 2

    end

    it "Exercicio 2 - Count Duplicates teste 3" do

      #arrange
      obj = "AABB"

      #act
      result = ApplicationHelper.count_duplicates(obj)
      
      #assert
      expect(result).to be == 2

    end

    it "Mock create do Active Record" do

      #arrange
      poker_card = Poker.new(name: "mockado", value: 2, user: "mockado", room: 1)
      allow(Poker).to(receive(:create).and_return(poker_card))
      
      #act
      mock_card = Poker.create(name: "aaaa")
      
      #assert
      expect(mock_card.name).to be == "mockado"

    end

  end
end
