class Like < ApplicationRecord
  after_create :create_notification

  belongs_to :user
  belongs_to :post

  private

  def create_notification
    post.user.create_notification('like', user, post)
  end
end
