module ApplicationHelper
  def set_user
    binding.pry
    @user = User.find_by(id: session[:user_id])
    redirect_to '/' if @user.nil?
  end

  def logged_in
    session[:user_id]
  end

end
