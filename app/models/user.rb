class User < ActiveRecord::Base
  has_many :reviews

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { without: /\s/ }
  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.where("LOWER(email)=?", email.strip.downcase).first
    if user && user.authenticate(password)
      user
    else
      false
    end
  end

end
