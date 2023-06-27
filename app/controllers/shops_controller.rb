class ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @shop = Shop.new
  end

  def index
    @q = Shop.ransack(params[:q])
    @shops = @q.result.includes(:user).page(params[:page]).per(5) #検索結果（検索しなければ全件取得）
  end

  def show
    @shop = Shop.find(params[:id])
    @comment = Comment.new
    @comments = @shop.comments
  end

  def create
    if current_user.admin
      @shop = Shop.new(shop_params)
      @shop.user_id = current_user.id
      if @shop.save
        @shop.save_tags(params[:tag][:name_text])
        redirect_to shop_path(@shop)
      else
        render :new
      end
    else
      redirect_to root_path
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    if current_user.admin
      @shop = Shop.find(params[:id])
      if @shop.update(shop_params)
        @shop.save_tags(params[:tag][:name_text])
        redirect_to shop_path(@shop)
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to shops_path
  end

  private

  def shop_params
    params.require(:shop).permit(:image,:name,:address,:opneing,:closed,:phone,:latitude,:longitude)
  end
end
