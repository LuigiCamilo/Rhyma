class AdvancesController < ApplicationController
  before_action :set_course, only: [:update]

  def next
    session[:lecture] = params[:lecture].to_i
    session[:course_id] = params[:course_id].to_i
    @advance = Advance.find_by(user_id: current_user.id, course_id: session[:course_id])
    if @advance.nil?
      create
    else
      update if @advance.lecture < session[:lecture]
        # raise
    end

    next_lecture = Lecture.find_by(course_id: session[:course_id], lecture:(session[:lecture]+1) )



    redirect_to course_lecture_path(session[:course_id], next_lecture), status: :found
  end

  def create
    @advance = Advance.new(lecture: 0, user_id: current_user.id, course_id: session[:course_id])
    @advance.save

    # redirect_to edit_course_lecture(@lecture), status: :no found
  end

  def update
    @advance.lecture = session[:lecture]
    @advance.update(lecture: session[:lecture])
      # redirect_to edit_course_lecture(@lecture), status: :found

  end

  private

  def set_course
    @advance = Advance.find(params[:id])
    @lecture = params[:lecture]
  end

  def advance_params
    params.require(:advance).permit(:course_id)
  end
end
