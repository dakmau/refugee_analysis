require 'indico'
class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  def create
    byebug
    post = Post.create(message: params[:message], latitude: request.location.latitude, longitude: request.location.longitude)
    if post.save
      flash[:success] = "You've successfully made a post!"
      redirect_to root_path
    end
  end
end
