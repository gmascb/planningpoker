require 'rails_helper'

RSpec.describe ClassRoom, type: :model do 

    # before(:each) { @double = double("test double") }
    # after(:each)  { reset @double }


    it 'ALLOW - the list_student_names method should work correctly' do 
        #arrange
        student1 = double('student') 
        student2 = double('student') 
        # allow(student1).to receive(:name) { 'A'} 
        # student1.unstub(:name)
        allow(student1).to receive(:name) { 'hot'} 
        allow(student2).to receive(:name) { 'dog'} 
        cr = ClassRoom.new [student1,student2]

        # act
        result = cr.list_student_names

        #assert
        expect(result).to(eq('hot,dog'))
    end

    #method stub deprecated
    it 'STUB deprecated - the list_student_names method should work correctly' do 
 
        #arrange
        student1 = double('student') 
        student2 = double('student') 
 
        # AO INVES DE > allow(student1).to receive(:name) { 'A'} 
        # usar STUB
        # student1.stub(:name).and_return("hot")
        # student1.unstub(:name)
        # student1.stub(:name).and_return("big hot")
        # student2.stub(:name).and_return("dog")

        allow(student1).to(receive(:name).and_return('big hot'))
        allow(student2).to(receive(:name).and_return('dog'))

        cr = ClassRoom.new [student1,student2]
 
        # act
        result = cr.list_student_names
 
        #assert
        expect(result).to(eq('big hot,dog'))

        #deprecated
        #student1.name.should(eq('big hot'))
        #student2.name.should(eq('dog'))
        expect(student1.name).to(eq('big hot'))
        expect(student2.name).to(eq('dog'))
    end 

    let(:dbl) { double }

    it "message_chain 1" do
        allow(dbl).to(receive_message_chain("one.two.three" => :four))
        expect(dbl.one.two.three).to(eq(:four))
        # dbl.stub_chain("foo.bar") { :baz }
        # dbl.stub_chain(:foo, :bar => :baz)
        # expect(dbl.foo.bar).to eq(:baz)
    end

    example "message_chain 2" do
        
        allow(dbl).to(receive_message_chain(:one, :two, :three => :four))
        expect(dbl.one.two.three).to(eq(:four))
        # dbl.stub_chain(:foo, :bar => :baz)
        # expect(dbl.foo.bar).to eq(:baz)

    end

    example "message_chain 3" do
        allow(dbl).to(receive_message_chain(:one, :two, :three).and_return(:four))
        expect(dbl.one.two.three).to(eq(:four))
        # dbl.stub_chain(:foo, :bar) { :baz }
        # expect(dbl.foo.bar).to eq(:baz)
    end

    # caso em que um metodo pode ser chamado mais de uma vez dentro da unidade
    # exemplo, um foreach
    it "Stub modificando codigo interno do metodo" do
        object = double("object")
        
        allow(object).to(receive(:foo)) do |arg|
            if arg == :this
                "got this"
            elsif arg == :that
                "got that"
            end
        end
        
        # object.stub(:foo) do |arg|
        #   if arg == :this
        #     "got this"
        #   elsif arg == :that
        #     "got that"
        #   end
        # end
        
        expect(object.foo(:this)).to(eq("got this"))
        expect(object.foo(:that)).to(eq("got that"))

    end


  end