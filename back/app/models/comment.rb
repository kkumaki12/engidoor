class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_one :best_answer, dependent: :destroy
  has_many :goods, dependent: :destroy
  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :content, presence: true, length: { maximum: 2000 }
  default_scope -> { order(created_at: :desc) }
end
