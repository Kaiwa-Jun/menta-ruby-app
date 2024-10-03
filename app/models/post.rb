class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy  

  validates :title, presence: true
  validates :body, presence: true

  after_create :create_notification

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  private

  def create_notification
    user.create_notification('post', user, self)
  end

end
