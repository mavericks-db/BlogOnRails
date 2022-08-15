class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_recent_3_posts = @user.recent_3_posts
  end

  def index
    @users = User.all
  end
end
