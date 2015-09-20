# class Api::V1::PostsController < ApplicationController
# end
module Api
  module V1
    class PostsController < ApplicationController
      skip_before_filter  :verify_authenticity_token

      def create
        post = Post.create(message: params[:message], latitude: params[:latitude], longitude: params[:longitude])
        Indico.api_key = '6b911bcc3dc867c5d5b9946b2f5b3345'
        post.positivity = Indico.sentiment(post.message)
        keyword_hash = Indico.text_tags(post.message)
        keyword_hash.each do |key, value|
          post.tags.create(word: key)
        end
        if post.save
          render json: {status: 200}
        end
      end
    end
  end
end