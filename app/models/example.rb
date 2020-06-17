class Example < ApplicationRecord
  belongs_to :vocab
  #has_one :user, through: :vocab
end
