class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @shop = Shop.find(params[:shop_id])
    comment = current_user.comments.new(comment_params)
    comment.shop_id = @shop.id
    comment.save
    @shops = Shop.find(params[:shop_id])
    @comment = Comment.new
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @comments = @shop.comments
    @comment.find_by(id: params[:id], shop_id: params[:shop_id])
    @comment.destroy
    @comment = Comment.new
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end