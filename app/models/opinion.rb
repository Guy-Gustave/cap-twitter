class Opinion < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :text, presence: true

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
