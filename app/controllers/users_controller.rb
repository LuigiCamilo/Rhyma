class UsersController < ApplicationController

  def show
    @user = current_user
    # @advances = Advances.find(current_user)
    #@user_courses = Course.where(current_user)
  end
end
