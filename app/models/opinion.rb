class Opinion < ApplicationRecord
  belongs_to :auther, class_name: 'User'
  has_many :likes, foreign_key: 'opinion_id', class_name: 'Like'
  validates :text, presence: true

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
