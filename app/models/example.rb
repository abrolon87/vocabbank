class Example < ApplicationRecord
  belongs_to :vocab

  validates :sentence, presence: true
  #has_one :user, through: :vocab
end
