class CategoriesController < ApplicationController
  before_action :current_category, only: [:show, :destroy]

  def index
    @categories = current_user.categories.all
  end

  def show
  end


  def new
    @category = Category.new
  end

  def create
    category = Category.create(category_params)
  end

  def destroy
    @category.destroy
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def current_category
    @category = Category.find(params[:id])
  end

end
