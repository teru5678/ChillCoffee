class CommentsController < ApplicationController

  def create
    @shop = Shop.find(params[:shop_id])
    @comment = current_user.comments.new(comment_params)
    @comment.shop_id = shop.id
    @comment.save
    redirect_to request.referer
  end

  def destroy
    Comment.find(params[:id])
    comment.destroy
    redirect_to request.referer
  end

  private

  def comment_params
    prams.require(:shop_comment).permit(:comment)
  end
end
