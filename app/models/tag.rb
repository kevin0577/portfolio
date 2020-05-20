class Tag < ApplicationRecord
	has_many :tagmaps, dependent: :destroy
	has_many :bikes, through: :tagmaps
end
