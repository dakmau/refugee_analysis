# class Api::V1::PostsController < ApplicationController
# end
module Api
  module V1
    class PostsController < ApplicationController
      def create
        post = Post.create(message: params[:message], latitude: params[:latitude], longitude: params[:longitude])
        if post.save
          render json: {status: 200}
        end
      end
    end
  end
end