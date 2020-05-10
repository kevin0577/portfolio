class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :bike
  validates :user_id, uniqueness: {scope: :bike_id}
end
