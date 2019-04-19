class ApplicationController < ActionController::Base
	helper_method :current_user

  def current_user
    if session[:pengguna_id]
      @current_user ||= Pengguna.find(session[:pengguna_id]) if session[:pengguna_id]
    else
      @current_user = nil
    end
  end
end
