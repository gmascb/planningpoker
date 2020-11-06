module Api
    class RoomSerializer < ActiveModel::Serializer
        attributes :id, :name, :card
    end
end