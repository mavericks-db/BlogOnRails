class PostsController < ApplicationController
  def show
    @post = Post.find(params[:post_id])
  end

  def index
    @posts = Post.includes(:user).where(user: params[:user_id])
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.likes_counter = 0
    @post.comments_counter = 0
    respond_to do |format|
      if @post.save
        format.html { redirect_to user_posts_path(user: @post.user), notice: 'Post was successfully created.' }
      else
        format.html { render :new, alert: 'Post was not created.' }
      end
    end
    @post.update_posts_counter
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
