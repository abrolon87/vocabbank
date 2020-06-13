class Vocab < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :examples
end
