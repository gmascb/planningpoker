# rake rswag:specs:swaggerize
require 'swagger_helper'

describe 'Api TechPoker' do

  path '/users' do

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

  path '/play' do

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
            "name": "",
            "value": 1,
            "user": "Steve Jobs",
            "room": 1
          }
        }

        run_test!
      end

    end
  end
end