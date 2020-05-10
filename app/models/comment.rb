class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :bike
  validates :comment, presence: true
end
