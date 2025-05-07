class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @new_genre = Genre.new
  end

  def create
  end

  def edit
  end
end
