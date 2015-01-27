class API::SessionsController < ApplicationController

  respond_to :json

  def create
    @house = House.find_by_name(login_params[:name])

    if @house && @house.authenticate(login_params[:password])

      inlog_information = []

      inlog_information << @house
      inlog_information << @house.apikey

      render :json => inlog_information
    else
      errors = ["Geen geldige gegevens"]
      render :json => errors
    end
  end


  private
    def login_params
      params.require(:house).permit(
      :name,
      :password)
    end

end
