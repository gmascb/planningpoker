require 'rails_helper'

RSpec.describe ClassRoom, type: :model do 
    it 'the list_student_names method should work correctly' do 
       
       binding.pry

       #arrange
       # build mocks
       student1 = double('student') 
       student2 = double('student') 
       puts student1.class

       allow(student1).to receive(:name) { 'A'} 
       puts student1.name
       
       #remove message
       student1.unstub(:name)
       puts student1.try(:name)

       allow(student1).to receive(:name) { 'hot'} 
       puts student1.name

       allow(student2).to receive(:name) { 'dog'} 
       puts student2.name
       
       cr = ClassRoom.new [student1,student2]

       # act
       result = cr.list_student_names

       #assert
       expect(result).to(eq('hot,dog'))
    end 
  end