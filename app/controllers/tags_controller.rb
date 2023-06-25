class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @shops = @tag.shops
  end
end
