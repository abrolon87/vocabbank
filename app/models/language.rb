class Language < ApplicationRecord
  has_many :vocabs, dependent: :delete_all
  has_many :users, through: :vocabs #, source: :user

  validates :language_name, presence: true, uniqueness: true

  #scope :sort_alphabetically, -> {order(language_name: :asc)}
end
