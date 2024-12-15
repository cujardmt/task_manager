class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user, :user_signed_in?
  
  # Ensure the user is logged in before 
  # allowing access to certain actions
  def authenticate_user
    unless user_signed_in?
      redirect_to login_path, alert: "Please log in to access this page."
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    current_user.present?
  end

end
