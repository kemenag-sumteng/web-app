module SessionsHelper
	# Logs in the given user.
  def log_in(pengguna)
    session[:pengguna_id] = pengguna.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    if session[:pengguna_id]
      @current_user ||= Pengguna.find_by(id: session[:pengguna_id])
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:pengguna_id)
    @current_user = nil
  end
end
