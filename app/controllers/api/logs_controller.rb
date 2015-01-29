class API::LogsController < ApplicationController

  before_filter :restrict_access
  respond_to :json

  def index
    @logs = Log.all
    render :json => @logs
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
      params.require(:log).permit(:name, :points, :user_id)
    end
end
