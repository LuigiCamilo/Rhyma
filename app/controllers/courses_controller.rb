class CoursesController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.select { |course| course.publish && course.lectures.positive? }
  end

  def new
    @course = Course.new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

    private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :stock, :brand, :pet, :category, :photo)
  end
end
