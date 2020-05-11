class Bike < ApplicationRecord
	belongs_to :user
	has_many :likes, dependent: :destroy
	has_many :bookmarks, dependent: :destroy
	has_many :comments, dependent: :destroy
	attachment :image

	validates :image, presence: true
	validates :title, presence: true,length: { maximum: 300 }
end
