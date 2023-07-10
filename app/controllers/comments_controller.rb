class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @shop = Shop.find(params[:shop_id])
    comment = current_user.comments.new(comment_params)
    comment.shop_id = @shop.id
    if comment.save
      flash[:notice] = "コメントが追加されました。"
      redirect_to request.referer
    else
      flash[:alret] = "コメントを入力してください。"
      redirect_to request.referer
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @comments = @shop.comments
    if Comment.find_by(id: params[:id], shop_id: params[:shop_id]).destroy
      flash[:notice] = "コメントが削除されました。"
      redirect_to request.referer
    else
      flash[:alret] = "コメントの削除に失敗しました。"
      redirect_to request.referer
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
