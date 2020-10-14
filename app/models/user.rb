class User < ApplicationRecord
  has_many :opinions, foreign_key: 'author_id',class_name: 'Opinion'

  has_many :followers,class_name:'Following',foreign_key:'follower_id'
  has_many :followed,class_name:'Following',foreign_key:'followed_id'

  has_one_attached :Photo
  has_one_attached :CoverIimage

  validates :username, presence: true, uniqueness: true
  validates :fullname, presence: true

  # def followto
  #   people = User.where.not(id: self.followers.pluck(:followed_id))
  # end

  def self.user_followers(id, curr_user_id)
    Following.where(Followedid: id).where.not(Followerid: curr_user_id).order(created_at: :desc).limit(5)
  end

  def self.all_users(user_id)
    User.where('id != ?', user_id)
  end
end
