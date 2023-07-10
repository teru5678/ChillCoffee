class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.admin
      @users = User.page(params[:page])
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
    @shops = @user.shops
    bookmarks = Bookmark.where(user_id: @user.id).pluck(:shop_id)
    @bookmark_list = Shop.find(bookmarks)
    @comments = Comment.where(user_id: @user.id)
  end
end
