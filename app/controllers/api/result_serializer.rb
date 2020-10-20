module Api
    class ResultSerializer < ActiveModel::Serializer
        attributes :name, :card
    end
end