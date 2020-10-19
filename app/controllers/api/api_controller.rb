module Api
    class ApiController < ActionController::API
        
        def users
            users = User.where("last_login >= '#{(DateTime.now - 30.days).strftime("%Y-%m-%d")}'")
            render json: users, each_serializer: UserSerializer, status: 200
        end

        def play

            room = Room.find_by_id(params[:room])
            
            if room.nil? 
                render json: { message: "Room doesn't exists" }, status: 404
            else

                players_name = room.playersname.split(",")

                if players_name.include?(params[:user]) || players_name.blank?

                    poker = Poker.find_or_create_by(room: params[:room],
                                                    user: params[:user],
                    )
                    poker.update_columns(name: params[:name], value: params[:value])
                    
                    render json: poker, seralizer: PokerSerializer, status: 200
                else
                    unauthorize_play
                end
            end
        end

        
        private 

        def unauthorize_play
            render json: { message: "You can't play!" }, status: 401
        end

    end
end