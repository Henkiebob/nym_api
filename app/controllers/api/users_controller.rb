  class API::UsersController  < ApplicationController

    before_filter :restrict_access

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
      @user = User.find_by_id(params[:id])
      render :json => @user
    end

  private
    def user_params
      params.require(:user).permit(:name, :email, :avatar)
    end

  end
