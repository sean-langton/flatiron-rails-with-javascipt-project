module LeaguesHelper

  def admin(league)
    User.find(league.admin_id)
  end

  def is_admin?
    session[:id] == league.admin_id
  end

end
