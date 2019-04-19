class SessionsController < ApplicationController
  def new
  end

  def create
  	pengguna = Pengguna.find_by_email(params[:email])
    if pengguna && pengguna.authenticate(params[:password])
      session[:pengguna_id] = pengguna.id
      redirect_to root_url, notice: "Anda berhasil masuk."
    else
      flash.now[:alert] = "Email atau password tidak valid"
      render "new"
    end
  end

  def destroy
  	session[:pengguna_id] = nil
    redirect_to root_url, notice: "Anda telah keluar."
  end
end
