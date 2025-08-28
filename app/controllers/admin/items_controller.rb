class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    # N+1問題を回避するため、genresテーブルを事前に結合
    @items = Item.includes(:genre).all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      # flash[:notice] = "You have created book successfully."
      redirect_to admin_item_path(@item.id), notice: '登録に成功しました。'
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item), notice: '編集に成功しました。'
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_image, :name, :introduction, :genre_id, :price, :is_active)
  end
end
