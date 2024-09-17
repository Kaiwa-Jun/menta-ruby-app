class LikesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    like = current_user.likes.new(post_id: post.id)

    respond_to do |format|
      if like.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("like_button_#{post.id}", partial: 'likes/like', locals: { post: post })
        end
      else
        format.html { redirect_to post, alert: 'Failed to favorite.' }
      end
    end
  end
  
  def destroy
    post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post_id: post.id)
    respond_to do |format|
      if like.destroy
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("like_button_#{post.id}", partial: 'likes/like', locals: { post: post })
        end
      else
        format.html { redirect_to post, alert: 'Failed to favorite.' }
      end
    end
  end
end
