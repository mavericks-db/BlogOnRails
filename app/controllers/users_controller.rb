class UsersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @recent_posts = @user.recent_3_posts
  end

  def index
    @users = User.all
  end
end
