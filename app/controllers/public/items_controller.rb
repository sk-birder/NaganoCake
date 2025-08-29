class Public::ItemsController < ApplicationController
  def index
    # @items = Item.all
    items = Item.where(is_active: true)
    @items = items.page(params[:page]).per(8)
    
    # if params[:genre] == '1'
      
    # else
    #   @items = items.page(params[:page]).per(8)
    # end
  end

  def show
  end
end
