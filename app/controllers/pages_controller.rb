class PagesController < ApplicationController

  def government
    @posts = Post.all.limit(100)
    @users = User.all.limit(100)
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
