class PagesController < ApplicationController
  def home
  end

  def government
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
