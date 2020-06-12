class User < ApplicationRecord
  has_secure_password
  has_many :vocabs
  has_many :languages, through: :vocabs
  has_many :comments
  has_many :vocabs, through: :comments
end



