require 'indico'
class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  def create
    byebug
    post = Post.create(message: params[:message], latitude: request.location.latitude, longitude: request.location.longitude)
    Indico.api_key = '6b911bcc3dc867c5d5b9946b2f5b3345'
    post.positivity = Indico.sentiment(message)
    if post.save
      flash[:success] = "You've successfully made a post!"
      redirect_to root_path
    end
  end
end
