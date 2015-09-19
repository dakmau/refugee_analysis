# class Api::V1::PostsController < ApplicationController
# end
module Api
  module V1
    class PostsController < ApplicationController
      skip_before_filter  :verify_authenticity_token

      def create
        post = Post.create(message: params[:message], latitude: params[:latitude], longitude: params[:longitude])
        if post.save
          render json: {status: 200}
        end
      end
    end
  end
end