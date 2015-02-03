class API::HousesController  < ApplicationController

  before_filter :restrict_access, only: [:show, :update, :get_habitants, :destroy]
  respond_to :json

  def show
    @house = House.find_by_id(params[:id])
    render :json => @house
  end

  def create
    @house  = House.new(house_params)

    if @house.save
      @apikey = Apikey.create(:house_id => @house.id)
      inlog_information = [house_id: @house.id, apikey: @apikey.access_token]
      render :json => inlog_information
    else
      render :json => @house.errors.full_messages
    end
  end

  def update
       @house = House.find(params[:id])

        if @house.update_attributes(house_params)
            creator = @house.users.first.name

            @house.users.each do |user|
              #send email
              UserMailer.welcome_email(user, @house, creator).deliver
            end
            render :json => @house.users
        else
            render :json => @house.errors.full_messages
        end
  end

  def get_habitants
      @users = User.where(:house_id => params[:id])
      render :json => @users
  end

  # def send_invite_mail
  #      @users   = User.where(:house_id => params[:id])
  #      @house   = House.find(params[:id])
  #      @creator = User.find(@house.created_by)

  #      @users.each do |user|
  #         UserMailer.welcome_email(user, @house, @creator).deliver
  #      end
  # end

  def upload
    @house = House.find_by_id(params[:id])
    @house.avatar = params[:image];
    if @house.save
        render :json => @house
    else
        render :json => @house.errors
    end
  end

  def avatar
      @house = House.find_by_id(params[:id])
      render :json => @house.avatar.url(:medium)
  end

  private
    def house_params
      params.require(:house).permit(
      :name,
      :password,
      :password_confirmation,
      :avatar,
      users_attributes: [ :id, :name, :email, :avatar, :house_id ])
    end

end
