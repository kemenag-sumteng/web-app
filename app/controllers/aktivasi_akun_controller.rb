class AktivasiAkunController < ApplicationController
	def edit
    pengguna = Pengguna.find_by(email: params[:email])
    if pengguna && !pengguna.activated? && pengguna.authenticated?(:activation, params[:id])
      pengguna.activate
      log_in pengguna
      flash[:success] = "Akun Anda telah diaktifkan!"
      redirect_to pengguna
    else
      flash[:danger] = "Tautan aktivasi tidak valid"
      redirect_to root_url
    end
  end
end
