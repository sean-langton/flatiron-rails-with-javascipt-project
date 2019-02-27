class UsersController < ApplicationController

  def show
    @user = params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Thank You For Joining Fantasy Fleets!"
        redirect_to user_path(@user)
      else
        render :new
      end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_digest, :email, :uid)
  end

end
