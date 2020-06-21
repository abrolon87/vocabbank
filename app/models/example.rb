class Example < ApplicationRecord
  belongs_to :vocab

  validates :sentence, presence: true
end
