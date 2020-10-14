module Api
    class ApiController < ActionController::API
        
        def users
            users = User.where("last_login >= '#{(DateTime.now - 30.days).strftime("%Y-%m-%d")}'")
            render json: users, each_serializer: UserSerializer, status: 200
        end

    end
end