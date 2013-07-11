helpers do
  
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def fullname
    @user.first_name + " " + @user.last_name
  end


end

