class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @shops = @tag.shops.page(params[:page]).per(5)
  end
end
