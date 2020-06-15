class Vocab < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :examples
  
  validates :word_or_phrase, presence: true 
  validates :translation, presence: true

  accepts_nested_attributes_for :language, reject_if: :all_blank

  # def language_attributes=(attr_hash)
  #   self.build_language(attr_hash)
  # end
  
end
