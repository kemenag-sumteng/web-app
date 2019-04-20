class Pengguna < ApplicationRecord
	attr_accessor :remember_token, :activation_token
	before_save :downcase_email
  before_create :create_activation_digest
  validates :nama_lengkap,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # Returns the hash digest of the given string.
  def Pengguna.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def Pengguna.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = Pengguna.new_token
    update_attribute(:remember_digest, Pengguna.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Activates an account.
  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    PenggunaMailer.account_activation(self).deliver_now
  end

  private
  # Create the token and digest.
  def create_activation_digest
    self.activation_token  = Pengguna.new_token
    self.activation_digest = Pengguna.digest(activation_token)
  end

  # Converts email to all lower-case.
  def downcase_email
    self.email = email.downcase
  end
end
