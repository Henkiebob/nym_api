class UsersController < ApplicationController

  def new
      @user = User.new()
  end

  def create
    @user = User.create(user_params)

    if @user.save
       respond_to do |format|
        format.json { render json: @user }
       end
    end
  end

end
