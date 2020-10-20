# rake rswag:specs:swaggerize
require 'swagger_helper'

describe 'Api TechPoker' do

  before(:each) {
    @room = Room.find_or_create_by!(name: "Name", players: 5, playersname: "", card: "Fibonacci")
    Poker.first_or_create(room: @room.id, name: "?", user: "SteveJobs", value: 1)
  }

  path '/api/users' do
    get 'Get Users' do
      tags 'Users'
      consumes 'application/json'

      response '200', 'Users Found' do
          schema type: :array,
                 items: {
                     type: :object,
                     properties: {
                         name: {
                                 type: :string,
                                 example: "Steve Jobs"
                              }
                     }
                 }

        run_test!
      end

    end
  end

  path '/api/play' do
    post 'Play Card' do
      tags 'Play'
      consumes 'application/json'

      parameter name: :play, in: :body, schema: {

        type: :object,
        properties: {
            name: {
                    type: :string,
                    example: "Pausa",
                    description: "value for a poker card",
                    enum: ["Não Entendi", "Pausa", "Infinito - Epico" ]
            },
            value: {
              type: :integer,
              example: 1,
              description: "value for a poker card",
              enum: %w[1 2 3 5 8 13 20 40 100]
            },
            user: {
              type: :string,
              description: "Name of player",
              example: "Steve Jobs"
            },
            room: {
              type: :integer,
              example: 1,
              description: "Number of your room"
            }    
        },
        required: %w[name value user room]

      }

      response '200', 'Poker Created' do

        let(:play){
          {
            "name": "?",
            "value": 1,
            "user": "Steve Jobs",
            "room": @room.id
          }
        }

        run_test!
      end

      response '422', "Room doesn't exists" do

        let(:play){
          {
            "name": "?",
            "value": 1,
            "user": "Steve Jobs",
            "room": nil
          }
        }

        run_test!
      end

    end
  end

  path '/api/rooms' do
    get 'Get Rooms' do
      tags 'Rooms'
      consumes 'application/json'

      parameter name: 'user', :in => :query, :type => :string

      response '200', 'Rooms Found' do
          schema type: :array,
                 items: {
                     type: :object,
                     properties: {
                         name: {
                                 type: :string,
                                 example: "My team room name"
                              },
                         card: {
                                type: :string,
                                example: "Fibonacci"
                             }
                     }
                 }

        let(:user) { "Steve Jobs" }

        run_test!
      end

    end
  end

  path '/api/results/{room}' do

    get 'Get Results' do
      tags 'Results'
      consumes 'application/json'

      parameter name: 'room', :in => :path, :type => :number

      response '200', 'Results Found' do
          schema type: :array,
                 items: {
                     type: :object,
                     properties: {
                          name: {
                                 type: :string,
                                 example: '?',
                                 "x-nullable": true,
                          },
                          value: {
                                type: :numeric,
                                example: 1
                          },
                          room: {
                              type: :numeric,
                              example: 1
                          },
                          user: {
                            type: :string,
                            example: "Steve Jobs"
                          }
                     }
                 }

        
        let(:room) { @room.id }
        
        run_test!
      end
    end
  end  

end