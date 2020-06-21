class Language < ApplicationRecord
  has_many :vocabs, dependent: :delete_all
  has_many :users, through: :vocabs 

  validates :language_name, presence: true, uniqueness: true

end
