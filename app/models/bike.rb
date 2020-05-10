class Bike < ApplicationRecord
	belongs_to :user
	has_many :likes, dependent: :destroy
	has_many :bookmarks, dependent: :destroy
	has_many :comments, dependent: :destroy
	attachment :image
end
