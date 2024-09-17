class Post < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy

  has_many :comments, foreign_key:true

  validates :title, presence: true
  validates :body, presence: true

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end
