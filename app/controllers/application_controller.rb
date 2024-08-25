class ApplicationController < ActionController::Base

  before_action :require_login 
  
  private

  def not_authenticated
    flash[:alert] = 'ログインが必要です'
    redirect_to new_session_path
  end
end
