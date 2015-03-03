class API::LogsController < ApplicationController

  before_filter :restrict_access
  respond_to :json

  def show
    logs = Log.where(:house_id => params[:id])

    logs.each do |log|
        if log.user_id
            log.user    = User.find_by_id(log.user_id)
            log.avatar  = user.avatar.url(:medium)
            log.save
        end
    end

    render :json => logs
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
