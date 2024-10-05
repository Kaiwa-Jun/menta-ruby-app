class Post < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy  
=======
  after_create :create_notification

  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy
>>>>>>> c175356e588f12f7f5bdc02e15eac8aafb741d93

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
