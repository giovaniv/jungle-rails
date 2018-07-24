class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews, dependent: :nullify

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 7 }
  validates :password_confirmation, presence: true, length: { minimum: 7 }
  validate  :check_passwords

  def check_passwords
    errors.add(:password, "should be the same as the password confirmation") if password != password_confirmation
  end

end
