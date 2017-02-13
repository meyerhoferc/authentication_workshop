class User < ApplicationRecord
  validates :name, :email, :password, presence: true
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    if user.password == password
      user
    else
      nil
    end
  end
end
