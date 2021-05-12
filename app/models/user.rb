class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  mount_uploader :image, ImageUploader
  has_many :questions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy



  def good_user?(comment_id)
    goods.exists?(comment_id: comment_id)
  end


    

end
