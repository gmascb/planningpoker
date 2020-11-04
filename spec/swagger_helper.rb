# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1 Techpoker',
        version: 'v1'
      },
      # securityDefinitions: {
      #     Authorization: {
      #         description: "Header for Authorization",
      #         type: :apiKey,
      #         name: 'Authorization',
      #         in: :header
      #     }
      # },
      # basePath: "/api",
      servers: [
        {
          url: 'https://{prodHost}',
          variables: {
            prodHost: {
              default: 'techpoker.herokuapp.com'
            },
          }
        },
        {
          url: 'http://{devHost}',
          variables: {
            devHost: {
              default: "localhost:3000",
            }
          }
        }
      ]
    }
  }
  # config.swagger_docs = {
  #   'v1/swagger.yaml' => {
  #     swagger: '2.0',
  #     info: {
  #       title: 'API V1',
  #       version: 'v1'
  #     },
  #     basePath: '/api',
  #     paths: {},
  #     # definitions: {
  #     #   contact: {
  #     #     type: :object,
  #     #     properties: {
  #     #       data: {
  #     #         type: :object,
  #     #         required: %i[name phone email address],
  #     #         properties: {
  #     #           name: { type: :string, example: 'magmaLabs.io' },
  #     #           phone: { type: :string, example: '+52 1 667 317 9035' },
  #     #           email: { type: :string, example: 'hello@magmalabs.io' },
  #     #           address: { type: :string, example: 'Av. Constitución #2035. Colima, Colima, MX, 28017' }
  #     #         }
  #     #       }
  #     #     }
  #     #   }
  #     # }
  #   }
  # }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end
