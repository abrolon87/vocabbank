class User < ApplicationRecord
  has_secure_password
  has_many :vocabs
  has_many :languages, through: :vocabs
end
