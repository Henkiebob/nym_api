  class API::UsersController  < ApplicationController

    before_filter :restrict_access

    def create
      users = []
      params["user"].each do |u|

        if u.second["house_id"].present?
          @house_id =  u.second["house_id"];
        end

        user = User.create(name: u.second["name"], email: u.second["email"], house_id: @house_id)
        users << user
      end

      render :json => users
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

  private
    def user_params
      params.require(:user).permit!
    end

  end
