class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.all
  end

  def new
    @new_item = Item.new
  end

  def create
  end

  def show
  end

  def edit
  end
end
