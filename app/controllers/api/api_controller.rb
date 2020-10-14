module Api
    class ApiController < ActionController::API
        
        def users
            byebug
            users = User.where("last_login >= '#{(DateTime.now - 30.days).strftime("%Y-%m-%d")}'")
            render json: users, each_serializer: UserSerializer
        end

    end
end