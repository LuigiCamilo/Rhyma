class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show, :edit, :update, :destroy]

  def index
    @lectures = Lecture.where('course_id = ?', params[:course_id])
  end

  def new
    @lecture = Lecture.new
  end

  def show
    @advance = Advance.find_by(user: current_user, course: @lecture.course_id)
    @finalizar = Lecture.find_by(course_id: @lecture.course_id, lecture: (@lecture.lecture + 1))
    if @advance.nil? && @lecture.lecture == 1
      @advance = Advance.new(lecture: 0, user_id: current_user.id, course_id: @lecture.course_id)
      @advance.save
    elsif @advance.nil?
      redirect_to course_path(@lecture.course), status: :found
    end
  end

  def create
    @lecture = Lecture.new(lecture_params)
    course = Course.find(params[:course_id])
    @lecture.course = course
    @lecture.lecture = @lecture.course.nil? ? 1 : @lecture.course.lectures.length + 1
    @lecture.published = true
    if @lecture.save
      redirect_to course_path(course)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    redirect_to course_path(@lecture.course) unless @lecture.course.user == current_user
  end

  def update
    if @lecture.update(lecture_params)
      redirect_to course_path(@lecture.course)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lecture.publish = false
    @lecture.save
    redirect_to courses_path, status: :see_other
  end

  private

  def set_lecture
    @lecture = Lecture.find(params[:id])
  end

  def lecture_params
    params.require(:lecture).permit(:title, :content, :course_id, :published, :photos, :video)
  end
end
