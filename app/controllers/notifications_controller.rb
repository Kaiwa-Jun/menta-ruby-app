class NotificationsController < ApplicationController
  
before_action :require_login, only: [:index]
    
def index
  @notifications = current_user.notifications.where(read: false)

    respond_to do |format|
      format.html do
        render
        mark_notifications_as_read
      end
    end
  end
  
private

# 未読通知をすべて既読にするメソッド
def mark_notifications_as_read
  current_user.notifications.where(read: false).update_all(read: true)
end




end
