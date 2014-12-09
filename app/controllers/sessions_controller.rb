class SessionsController < ApplicationController

  def create
    house = House.find_by_name(params[:name])

    if house && house.authenticate(params[:password])
      session[:current_house_id] = house.id;
      redirect_to dashboard_index_path, :notice => "Welkom!"
    else
      redirect_to "/", alert: "Geen geldige gegevens"
    end
  end

  def destroy
    session.delete(:current_house_id)
    redirect_to log_in_path, :notice => "Logged out!"
  end
end
