class CategoriesController < ApplicationController
  before_action :current_category, only: [:show, :destroy]

  def index
    @categories = current_user.categorie.all
  end

  def show
  end


  def new
    @categorie = Categorie.new
  end

  def create
    categorie = Categorie.create(categorie_params)
  end

  def destroy
    @categorie.destroy
  end

  private

  def categorie_params
    params.require(:categorie).permit(:name)
  end

  def current_category
    @categorie = Categorie.find(params[:id])
  end

end
