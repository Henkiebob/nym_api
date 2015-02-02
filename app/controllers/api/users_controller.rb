  class API::UsersController  < ApplicationController

    before_filter :restrict_access

    def create
        params["users"].each do |user|
            @user = User.new(user_params)
        end
    end

    def update
        @user = User.find_by_id(params[:id])

        if @user.update_attributes(user_params)
         render :json => @user
        else
            errors = ["Geen gebruiker gevonden"]
            render :json => errors
        end
    end

    def show
      @user   = User.find_by_id(params[:id])
      render :json => @user
    end

    def upload
      @user = User.find_by_id(params[:id])
      @user.avatar = params[:image];
      if @user.save
          render :json => @user
      else
          render :json => @user.errors
      end
    end

    def avatar
        @user = User.find_by_id(params[:id])
        render :json => @user.avatar.url(:medium)
    end

  private
    def user_params
     params.require(:user).permit(:name, :email, :house_id)
    end
  end
