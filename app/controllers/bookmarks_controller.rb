class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @shop = Shop.find(params[:shop_id])
    bookmark = @shop.bookmarks.new(user_id: current_user.id)
    bookmark.save
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    bookmark = current_user.bookmarks.find_by(user_id: current_user.id)
    bookmark.destroy
  end
end
