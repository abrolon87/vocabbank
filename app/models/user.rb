class User < ApplicationRecord
  has_secure_password
  has_many :vocabs
  has_many :languages, through: :vocabs

  validates  :username, :email, presence: true, uniqueness: true
  validates :name, :password_digest, presence: true
end



