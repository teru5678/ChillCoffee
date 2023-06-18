class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @shops = @user.shops
    bookmarks = Bookmark.where(user_id: current_user.id).pluck(:shop_id)
    @bookmark_list = Shop.find(bookmarks)
    @comments = Comment.where(user_id: @user.id)
  end

  def edit
  end

  private
    def user_admin
       @users = User.all
       if  current_user.admin == false
           redirect_to root_path
       else
           render action: "index"
       end
    end
end
