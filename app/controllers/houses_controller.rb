class HousesController < ApplicationController

  before_filter :logged_in!, only: [:index]

  def new
    @house = House.new()

    2.times do
      @house.users.build
    end
  end

  def create
    @house = House.new(house_params)

    if @house.save
      session.delete(:user_id)
      session[:current_house_id] = @house.id;
      redirect_to '/dashboard', :notice => "Bedankt voor het registeren"
    else
      render :new
    end
  end

  def edit
      @house = House.find_by_id(params[:id])
      @house.users.build
  end

  def update
       @house = House.find(params[:id])

        if @house.update_attributes(house_params)
            redirect_to '/dashboard', :notice => "Opgeslagen"
        else
            format.html { render action: "edit" }
        end
  end

  private
    def house_params
      params.require(:house).permit(:name, :password, :password_confirmation, users_attributes: [ :id, :name, :email, :color, :avatar ])
    end
end
