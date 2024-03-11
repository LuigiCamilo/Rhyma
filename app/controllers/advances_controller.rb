class AdvancesController < ApplicationController
  before_action :set_course, only: [:update]

  def next
    session[:lecture] = params[:lecture]
    session[:course_id] = params[:course_id]
    @advance = Advance.find_by(user_id: current_user.id, course_id: session[:course_id])
    if @advance.nil?
      create
    else
      update if @advance.lecture < session[:lecture]
        # raise

      end
    end

    redirect_to edit_course_lecture(@lecture), status: :found
  end

  def create
    @advance = Advance.new(lecture: session[:lecture], user_id: current_user.id, course_id: session[:course_id])
    @advance.save

    # redirect_to edit_course_lecture(@lecture), status: :no found
  end

  def update
    @advance.lecture = session[:lecture]
    unless @advance.update(lecture: session[:lecture], user_id: current_user.id, course_id: session[:course_id])
      # redirect_to edit_course_lecture(@lecture), status: :found
    end
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
