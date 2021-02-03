class User < ApplicationRecord
  has_secure_password
  has_many :favs
  has_many :favourite_shoes, through: :favs, source: :shoe
end
