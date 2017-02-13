class Session < ApplicationRecord
  validates :email, :password, presence: true
end
