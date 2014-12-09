class API::HousesController  < ApplicationController

  before_filter :restrict_access
  respond_to :json

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

  def get_habitants
      @users = User.where(:house_id => params[:id])
      render :json => @users
  end

  private
    def house_params
      params.require(:house).permit(
      :name,
      :password,
      :password_confirmation,
      users_attributes: [ :id, :name, :email, :avatar ])
    end

end
