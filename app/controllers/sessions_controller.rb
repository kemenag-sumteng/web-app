class SessionsController < ApplicationController
  def new
  end

  def create
  	pengguna = Pengguna.find_by_email(params[:session][:email].downcase)
    if pengguna && pengguna.authenticate(params[:session][:password])
      log_in pengguna
      params[:session][:remember_me] == '1' ? remember(pengguna) : forget(pengguna)
      redirect_back_or pengguna
    else
      flash.now[:danger] = "Email atau password tidak valid"
      render "new"
    end
  end

  def destroy
  	log_out if logged_in?
    redirect_to root_path, notice: "Terima kasih telah menggunakan aplikasi ini."
  end
end
