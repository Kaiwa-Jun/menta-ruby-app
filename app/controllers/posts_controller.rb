class PostsController < ApplicationController
  
  before_action :require_login, only: [:index, :new, :create, :edit, :update]
  
  def index
    @posts = current_user.posts.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, notice: '投稿が成功しました'
    else
      render :new
    end
  end

  def show
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to posts_path, alert: "指定された投稿が見つかりません。"
    end
  end

  def edit
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to posts_path, alert: "指定された投稿が見つかりません。"
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: '投稿が更新されました'
    else
      render :edit
    end
  end

  # 上記アクションには、ログインユーザーかつそのユーザーが投稿したもののみアクセスできるようにすること

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
  
end