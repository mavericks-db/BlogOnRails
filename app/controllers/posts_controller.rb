class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.where(user: params[:user_id])
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    new_post = Post.new(post_params)
    new_post.user = current_user
    new_post.likes_counter = 0
    new_post.comments_counter = 0
    respond_to do |format|
      if new_post.save
        format.html { redirect_to user_posts_path(user: new_post.user), notice: 'Post was successfully created.' }
      else
        format.html { render :new, alert: 'Post was not created.' }
      end
    end
    new_post.update_posts_counter
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
