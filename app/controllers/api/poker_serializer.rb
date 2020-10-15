module Api
    class PokerSerializer < ActiveModel::Serializer
        attributes :name, :value, :room, :user
    end
end