class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome back to Fantasy Fleets!"
    else
      redirect_to signin_path, notice: "Error finding user, please confirm username and password and try again"
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_url, notice: "You've been logged out of Fantasy Fleets."
  end
end
