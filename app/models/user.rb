class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255},
  format: { with: VALID_EMAIL_REGEX},
  uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :password, length: {minimum: 6}

  # Validates whether a user exists based upon email and password
  def self.authenticate_with_credentials(email, password)
    cleaned_email = email.gsub(/\s+/  , '').downcase
    (user = User.find_by(email: cleaned_email).try(:authenticate, password)) ? user : nil
  end

end
