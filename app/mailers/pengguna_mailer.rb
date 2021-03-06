class PenggunaMailer < ApplicationMailer
  default :from => 'bimkat.kemenag.sumteng@gmail.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pengguna_mailer.account_activation.subject
  #
  def account_activation(pengguna)
    @pengguna = pengguna
    mail to: pengguna.email, subject: "Aktivasi akun Anda di Aplikasi Web Bimas Katolik"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pengguna_mailer.password_reset.subject
  #
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
