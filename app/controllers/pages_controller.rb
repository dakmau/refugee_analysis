class PagesController < ApplicationController

  def government
    @posts = Post.all.limit(100)
    @users = User.all.limit(100)

    #keywords
    @berlin_tags = Tag.near("Berlin", 150).limit(5)
    @istanbul_tags = Tag.near("Istanbul", 150).limit(5)
    @toronto_tags = Tag.near("Toronto", 150).limit(5)
  end

  def refugee_search
  end

  def refugee_show
    @user = User.find_by(name: params[:name])
    if @user.blank?
      flash[:danger] = "User not found"
      redirect_to(:back)
      return
    end
  end
end
