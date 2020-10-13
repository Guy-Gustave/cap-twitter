class User < ApplicationRecord
  has_many :opinions, foreign_key: 'authorId',class_name: 'Opinion'

  has_many :followers,class_name:'Following',foreign_key:'follower_id'
  has_many :followeds,class_name:'Following',foreign_key:'followed_id'

  has_one_attached :photo
  has_one_attached :cover_image

  validates :username, presence: true, uniqueness: true
  validates :fullname, presence: true
end
