class Api::V1::PostsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])

    respond_to do |format|
      format.json { render json: @post }
    end
  end

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    respond_to do |format|
      format.json { render json: @posts }
    end
  end
end
