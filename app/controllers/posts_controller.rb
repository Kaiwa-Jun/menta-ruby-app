class PostsController < ApplicationController
  
  before_action :require_login, only: [:index, :new, :create, :edit, :update]
  
  def index
    @posts = Post.order(created_at: :desc)
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
    @comment = Comment.new
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

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    if @post
      @post.destroy
      redirect_to root_path, alert: '投稿を削除しました。'
    else
      redirect_to posts_path, alert: '指定された投稿が見つかりません。'
    end
  end

  def search
    @keyword = params[:keyword]
    if@keyword.present?
      @posts = Post.where("title LIKE(?) OR body LIKE(?)", "%#{@keyword}%", "%#{@keyword}%")
      if @posts.empty?
        flash.now[:alert] = "検索ワード#{@keyword}はヒットしませんでした"
      end

      render :index
    else
      redirect_to posts_path, alert: '検索ワードを入力してください'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
  
end