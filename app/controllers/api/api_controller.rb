module Api
    class ApiController < ActionController::API

        def users
            users = User.where("last_login >= '#{(DateTime.now - 30.days).strftime("%Y-%m-%d")}'").order(:name)
            render json: users, each_serializer: UserSerializer, status: 200
        end

        def play
            room = Room.find_by_id(params[:room])
            
            if room.nil? 
                incorrect_room
            else

                players_name = room.playersname.split(",")

                if players_name.include?(params[:user]) || players_name.blank?
                    poker = play_card
                    render json: poker, seralizer: PokerSerializer, status: 200
                else
                    unauthorize_play
                end
            end
        end

        def rooms
            render json: Room.filtered(params[:user] || ''), each_serializer: RoomSerializer, status: 200
        end

        def results
            render json: Poker.by_room(params[:room]) , each_serializer: PokerSerializer, status: 200
        end

        private

        def unauthorize_play
            render json: { message: "You can't play!" }, status: 401
        end

        def incorrect_room
            render json: { message: "Room doesn't exists" }, status: 422
        end

        def play_card
            Poker.play(params[:room], 
                        params[:user], 
                        params[:name], 
                        params[:value])
        end

    end
end