class Post < ApplicationRecord
  after_create :create_notification

  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  private

  def create_notification
    user.create_notification('post', user, self)
  end
end
