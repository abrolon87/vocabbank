class Language < ApplicationRecord
  has_many :vocabs
  has_many :users, through: :vocabs #, source: :user
end
