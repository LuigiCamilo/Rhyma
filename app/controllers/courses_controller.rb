class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @courses = Course.select { |course| course.published }
    # course.lectures.positive?
    # if params[:query].present?
    #   @courses = Course.search(params[:query])
    # end
  end

  def new
    @course = Course.new
  end

  def show
    @reviews = @course.reviews
    @lectures = @course.lectures
    @first_lecture = Lecture.find_by(lecture: 1, course_id: @course)
    @advance = nil
    @advance = Advance.find_by(user: current_user, course: @course) if user_signed_in?
    @advance = Advance.new if @advance.nil?
    @teacher = User.find(@course.user_id)
    # console
    # raise
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    @course.published = true
    if @course.save
      redirect_to new_course_lecture_path(@course)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    redirect_to course_path(@course) unless @course.user == current_user
  end

  def update
    if @course.update(course_params)
      redirect_to course_path(@course)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def complete
  end

  def destroy
    @course.published = false
    # @course.lectures.map(&method(:lecture_update))
    @course.save
    redirect_to courses_path, status: :see_other
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :theme_id, :published, :photo)
  end

  def lecture_update(lecture)
    lecture.published = false
    lecture.save
  end
end
