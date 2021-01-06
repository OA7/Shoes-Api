class Fav < ApplicationRecord
  belongs_to :user
  belongs_to :shoe
  validates_uniqueness_of :shoe_id, scope: :user_id
end
