class Notification < ApplicationRecord

  scope :unread, -> { where(read: false) }
  default_scope -> { order(created_at: :desc) }

  belongs_to :user, class_name: "User"
  belongs_to :notified_by, class_name: "User"
  belongs_to :post, optional: true
end