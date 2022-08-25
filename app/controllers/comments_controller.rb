class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])
    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to user_post_path(user: @comment.user, post: @comment.post),
                      notice: 'Comment was successfully created.'
        end
      else
        format.html { render :new, alert: 'Comment was not created.' }
      end
    end
    @comment.update_comments_counter
  end


   def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to user_post_path(user: @post.user), notice: 'Comment was successfully deleted.' }
      end
      @comment.update_comments_counter
    end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
