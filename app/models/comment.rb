class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content,  length: { minimum: 1 }

  after_create :create_notification

  private

  def create_notification
    post.user.create_notification('comment', user, post)
  end
  
end
