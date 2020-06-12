class Vocab < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :comments
  has_many :users, through: :comments
end
