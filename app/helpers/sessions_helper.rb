module SessionsHelper
    # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
  
  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def get_out #if the user is not logged, he has not acess to confidencial information 
    if current_user.nil?
        redirect_to login_path
    end
  end

  def user_kick #if the user is logged, can't get logged again
    if !logged_in?
        redirect_to login_path
    end
  end
end
