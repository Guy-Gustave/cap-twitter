class Following < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  def self.find_friend_to_unfollow(sender_id, receiver_id)
    Following.where(Followerid: sender_id).where(Followedid: receiver_id)[0]
  end
end
