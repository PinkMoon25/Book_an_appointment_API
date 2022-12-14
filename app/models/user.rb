class User < ApplicationRecord
  has_secure_password
  has_many :reservations, dependent: :destroy
  has_many :mentors, through: :reservations
  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true
end
