class ShopsController < ApplicationController
  def new
    @shop = Shop.new
  end

  def

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      @shop.save_tags(params[:tag][:name_text])
      redirect_to shop_path(@shop)
    else
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      @shop.save_tags(params[:tag][:name_text])
      redirect_to shop_path(@shop)
    else
      render :edit
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
