class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @shops = @user.shops
    bookmarks = Bookmark.where(user_id: @user.id).pluck(:shop_id)
    @bookmark_list = Shop.find(bookmarks)
    @comments = Comment.where(user_id: @user.id)
  end
end
