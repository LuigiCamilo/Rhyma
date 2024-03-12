class ReviewsController < ApplicationController
  def new
    @review = Reviews.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to review_path(@review)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    redirect_to review_path(@review) unless @review.user == current_user
  end

  def update
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # def set_course
  #   @review = Review.find(params[:id])
  #   @coment = params[:coment]
  #   @rating = params[:rating]
  # end

  def review_params
    params.require(:review).permit(:course_id, :rating, :coment)
  end
end
