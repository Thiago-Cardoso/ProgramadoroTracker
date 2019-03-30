class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categorys = current_user.categories.all
  end

  def show
  end

  def new
    @category = current_user.categories.build
  end

  def edit

  end

  def create
    @category = current_user.categories.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Categoria criada com sucesso' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Categoria atualizada com sucesso!.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_path, notice: 'Categoria deletada com sucesso!.' }
      format.json { head :no_content }
    end
  end

   private
    def set_category
      @category = Category.find(params[:id])
    end

   private 
    def category_params
      params.require(:category).permit(:description,:user_id)
    end

end

