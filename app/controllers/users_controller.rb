class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(name: params[:user][:name])
    if user.save
      flash[:success] = "Successfully created a new user"
      redirect_to action: "index"
    end
  end
end
