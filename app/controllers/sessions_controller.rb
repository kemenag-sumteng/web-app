class SessionsController < ApplicationController
  def new
  end

  def create
  	pengguna = Pengguna.find_by_email(params[:session][:email])
    if pengguna && pengguna.authenticate(params[:session][:password])
      log_in pengguna
      redirect_to root_path, notice: "Anda berhasil masuk."
    else
      flash.now[:danger] = "Email atau password tidak valid"
      render "new"
    end
  end

  def destroy
  	session[:pengguna_id] = nil
    redirect_to root_path, notice: "Terima kasih telah menggunakan aplikasi ini."
  end
end
