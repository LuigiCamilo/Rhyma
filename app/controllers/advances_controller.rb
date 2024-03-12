class AdvancesController < ApplicationController
  before_action :set_course, only: [:update]

  def create
    @advance = Advance.new(advance_params)
    @advance.user = current_user
    @advance.lecture = 0
    @advance.save
  end

  def update
    @advance.lecture = @lecture
    @advance.save
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
