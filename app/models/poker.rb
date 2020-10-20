class Poker < ActiveRecord::Base

    Poker.where(room: @sala).where("VALUE > 0").group(:value).count.sort

    scope :by_room, -> (room_id){
        where(room: room_id).where("VALUE > 0")
    }

end
