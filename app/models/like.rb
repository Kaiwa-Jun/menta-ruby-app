class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :create_notification

  private


  def create_notification
    post.user.create_notification('like', user, post)
  end

end
