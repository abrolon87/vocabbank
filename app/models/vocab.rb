class Vocab < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :examples
  
  validates :word_or_phrase, presence: true 
  validates :translation, presence: true

  accepts_nested_attributes_for :language
  
end
