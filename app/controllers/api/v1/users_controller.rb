class Api::V1::UsersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @recent_posts = @user.recent_3_posts

    respond_to do |format|
      format.json { render json: @user }
    end
  end

  def index
    @users = User.all

    respond_to do |format|
      format.json { render json: @users }
    end
  end
end
