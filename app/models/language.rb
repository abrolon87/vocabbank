class Language < ApplicationRecord
  has_many :vocabs, dependent: :delete_all
  has_many :users, through: :vocabs #, source: :user
end
