class Vocab < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :examples, dependent: :delete_all
  
  validates :word_or_phrase, presence: true, uniqueness: true 
  validates :translation, presence: true

  accepts_nested_attributes_for :language, reject_if: :all_blank

  scope :sort_alphabetically, -> {order(word_or_phrase: :asc)}

  # def language_attributes=(attr_hash)
  #   self.build_language(attr_hash)
  # end

  def self.search(query)
    where('word_or_phrase LIKE ?', "%#{query}%")
  end
  
end
