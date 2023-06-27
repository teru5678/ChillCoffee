class HomesController < ApplicationController
  def top
    @q = Shop.ransack(params[:q])
  end
end
