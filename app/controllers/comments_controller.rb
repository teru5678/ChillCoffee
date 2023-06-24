class CommentsController < ApplicationController

  def create
    @shop = Shop.find(params[:shop_id])
    comment = current_user.comments.new(comment_params)
    comment.shop_id = @shop.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @comments = @shop.comments
    Comment.find_by(id: params[:id], shop_id: params[:shop_id]).destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
