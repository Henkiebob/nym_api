  class API::UsersController  < ApplicationController
    require 'digest/md5'
    before_filter :restrict_access, only: [:show, :update]
    respond_to :png, only: [:avatar]

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

      if params[:image]
          @user.avatar = params[:image]
      end

      if @user.save
          render :json => @user
      else
          render :json => @user.errors
      end
    end

    def avatar
        @user = User.find_by_id(params[:id])

        if !@user.avatar_file_size.nil?
            @avatar = File.open(@user.avatar.url(:thumb))
        else
            filename = Digest::MD5.hexdigest(@user.email)
            img = Avatarly.generate_avatar(@user.name, opts={:size => 150})
              File.open('public/images/'+filename+'.png', 'wb') do |f|
                f.write img
            end

            @avatar = File.open('public/images/'+filename+'.png')
        end

        respond_to do |format|
            format.png { send_data @avatar.read, type: "image/png", disposition: 'inline'}
        end
    end

  private
    def user_params
     params.require(:user).permit(:name, :email, :house_id)
    end

  end
