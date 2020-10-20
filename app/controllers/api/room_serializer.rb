module Api
    class RoomSerializer < ActiveModel::Serializer
        attributes :name, :card
    end
end