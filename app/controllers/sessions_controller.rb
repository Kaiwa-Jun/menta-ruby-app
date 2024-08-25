class SessionsController < ApplicationController
  
  skip_before_action :require_login, only: %i[create new]

  def new
  end

  def create
    user = login(params[:email], params[:password])
    if user
      redirect_back_or_to root_path, notice: 'ログインに成功しました'
    else
      flash.now[:alert] = 'メールアドレスまたはパスワードが違います'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice:'ログアウトしました'
  end

end