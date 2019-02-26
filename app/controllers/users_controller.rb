class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Welcome to Fantasy Fleets!"
        redirect_to user_path(@user)
      else
        render :new
      end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_digest, :email, :message)
  end

  def set_user
    @user = User.find_by(id: session[:user_id])
    redirect_to '/' if @user.nil?
  end

end
