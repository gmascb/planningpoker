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
end