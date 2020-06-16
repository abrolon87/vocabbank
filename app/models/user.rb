class User < ApplicationRecord
  has_secure_password
  has_many :vocabs
  has_many :languages, through: :vocabs

  validates  :username, :email, presence: true, uniqueness: true
  validates :name, :password_digest, presence: true

  def self.from_omniauth(auth)
    find_or_create_by(username: auth.info.nickname) do |user|
      user.username = auth.info.nickname
      user.id = auth.uid
      user.password = SecureRandom.hex
    end
  end
  
end



