module SessionsHelper
	# Logs in the given user.
  def log_in(pengguna)
    session[:pengguna_id] = pengguna.id
  end

  # Remembers a user in a persistent session.
  def remember(pengguna)
    pengguna.remember
    cookies.permanent.signed[:pengguna_id] = pengguna.id
    cookies.permanent[:remember_token] = pengguna.remember_token
  end

  # Returns true if the given user is the current user.
  def current_user?(pengguna)
    pengguna == current_user
  end

  # Returns the user corresponding to the remember token cookie.
  def current_user
    if (pengguna_id = session[:pengguna_id])
      @current_user ||= Pengguna.find_by(id: pengguna_id)
    elsif (pengguna_id = cookies.signed[:pengguna_id])
      pengguna = Pengguna.find_by(id: pengguna_id)
      if pengguna && pengguna.authenticated?(cookies[:remember_token])
        log_in pengguna
        @current_user = pengguna
      end
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Forgets a persistent session.
  def forget(pengguna)
    pengguna.forget
    cookies.delete(:pengguna_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out
    forget(current_user)
    session.delete(:pengguna_id)
    @current_user = nil
  end
end
