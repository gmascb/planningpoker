class Poker < ActiveRecord::Base

    scope :by_room, -> (room_id){
        where(room: room_id).where("VALUE > 0")
    }


    def self.play(room, user, name, value)
        poker = Poker.find_or_initialize_by(room: room, user: user)

        poker.name = name
        poker.value = value
        poker.save
        
        return poker
    end


end
