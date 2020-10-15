class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  belongs_to :opinion, foreign_key: 'opinion_id', class_name: 'Opinion'

  def self.find_user_like(user_id, opinion_id)
    Like.where(user_id: user_id).where(opinion_id: opinion_id)[0]
  end
end
