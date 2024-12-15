class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render 'index'
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
    category_find(params[:id])
  end

  def update
    if category_find(params[:id]).update(category_params)
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def delete
    category_find(params[:id])
  end

  def destroy
    category_find(params[:id]).destroy
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  private
  def category_find(id)
    @category = Category.find(id)
  end
end