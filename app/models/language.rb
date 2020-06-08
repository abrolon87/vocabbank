class Language < ApplicationRecord
  #belongs_to :user 
  has_many :vocabs
  has_many :users, through: :vocabs 
end
