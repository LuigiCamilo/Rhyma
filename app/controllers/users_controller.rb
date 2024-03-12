class UsersController < ApplicationController

  def show
    @user = current_user
    @advances = Advance.where('user_id = ?', current_user.id)
  end
end
