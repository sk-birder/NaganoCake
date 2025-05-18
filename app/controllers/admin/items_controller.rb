class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.all
    @genres = Genre.all
  end

  def new
    @new_item = Item.new
  end

  def create
    @new_item = Item.new(item_params)
    if @new_item.save
      # flash[:notice] = "You have created book successfully."
      redirect_to admin_item_path(@new_item.id)
    else
      render
    end
  end

  def show
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id, :price, :is_active)
  end
end
