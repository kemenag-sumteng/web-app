class AktivasiAkunController < ApplicationController
	def edit
    pengguna = Pengguna.find_by(email: params[:email])
    if pengguna && !pengguna.activated? && pengguna.authenticated?(:activation, params[:id])
      pengguna.update_attribute(:activated,    true)
      pengguna.update_attribute(:activated_at, Time.zone.now)
      log_in pengguna
      flash[:success] = "Akun Anda telah diaktifkan!"
      redirect_to pengguna
    else
      flash[:danger] = "Tautan aktivasi tidak valid"
      redirect_to root_url
    end
  end
end
