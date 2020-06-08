class User < ApplicationRecord
  has_many :vocabs
  has_many :languages, through: :vocabs
end
