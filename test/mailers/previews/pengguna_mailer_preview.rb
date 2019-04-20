# Preview all emails at http://localhost:3000/rails/mailers/pengguna_mailer
class PenggunaMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/pengguna_mailer/account_activation
  def account_activation
    PenggunaMailer.account_activation
  end

  # Preview this email at http://localhost:3000/rails/mailers/pengguna_mailer/password_reset
  def password_reset
    PenggunaMailer.password_reset
  end

end
