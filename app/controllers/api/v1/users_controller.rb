# class Api::V1::UsersController < ApplicationController
# end
module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = User.create(name: params[:name])
        if user.save
          render json: {user_id: user.id}, status: 200
        end
      end
    end
  end
end