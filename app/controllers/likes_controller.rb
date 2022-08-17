class LikesController < ApplicationController
  def create
    @user_like = current_user
    @post_like = Post.find(params[:post_id])
    @like = Like.new(user: @user_like, post: @post_like)
    redirect_back_or_to user_post_path(@post_like.user.id, @post_like.id)
    @like.update_likes_counter if @like.save
  end
end
