# Preview all emails at http://localhost:3000/rails/mailers/pengguna_mailer
class PenggunaMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/pengguna_mailer/account_activation
  def account_activation
  	pengguna = Pengguna.first
    pengguna.activation_token = Pengguna.new_token
    PenggunaMailer.account_activation(pengguna)
  end

  # Preview this email at http://localhost:3000/rails/mailers/pengguna_mailer/password_reset
  def password_reset
    PenggunaMailer.password_reset
  end

end
