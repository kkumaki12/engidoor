class Question < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 2000 }
  default_scope -> { order(created_at: :desc) }

  def save_tags(savequestion_tags)
    savequestion_tags.each do |new_name|
      question_tag = Tag.find_or_create_by(name: new_name)
      self.tags << question_tag
    end
  end

  def self.search(search)
    if search
      Question.where(['content LIKE ?', "%#{search}%"])
    else
      Question.all
    end
end
end
