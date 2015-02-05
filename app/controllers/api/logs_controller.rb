class API::LogsController < ApplicationController

  before_filter :restrict_access
  respond_to :json

  def show
    @log = Log.where(:house_id => params[:id])
    render :json => @log
  end

  def create
    @log  = Log.new(log_params)

    if @log.save
        render :json => @log
    else
      render :json => @log.errors.full_messages
    end
  end

  private
    def log_params
      params.require(:log).permit(:name, :points, :user_id, :house_id)
    end
end
