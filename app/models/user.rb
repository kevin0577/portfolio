class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bikes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarks_bikes, through: :bookmarks, source: :bike
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower
  attachment :profile_image

 def follow(user_id)
 	follower.create(followed_id: user_id)
 end

 def unfollow(user_id)
 	follower.find_by(followed_id: user_id).destroy
 end

 def following?(user)
 	following_user.include?(user)
 end

  validates :name, presence: true,length: { minimum: 2, maximum: 20 }
  validates :bike_name, presence: true,length: { minimum: 2, maximum: 20 }

end
