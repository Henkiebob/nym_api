class StatisticsController < ApplicationController

  def index
      @users = User.all()
      @tasks = Task.all()
      @houses = House.all()
  end

  def show
      @house = House.find_by_id(params[:id])
  end

end
