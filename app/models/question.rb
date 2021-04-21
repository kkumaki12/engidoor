class Question < ApplicationRecord
  belongs_to :user
  has_many :comments,dependent: :destroy
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 2000 }
  default_scope -> { order(created_at: :desc) }
end
