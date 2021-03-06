class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :redirect_to_root_if_not_logged_in

  def index
    if logged_in?
      redirect_to potlucks_path
    end
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    if logged_in?
      User.find_by(id:session[:user_id])
    end
  end

  def redirect_to_root_if_not_logged_in
    if !logged_in?
      redirect_to root_path
    end
  end

end
