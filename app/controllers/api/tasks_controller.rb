class API::TasksController < ApplicationController

  before_filter :restrict_access
  respond_to :json

  def index
    @tasks = Task.where(:house_id => params[:house_id]).order(:deadline)
    render :json => @tasks
  end

  def update
       @task = Task.find(params[:id])

        if @task.update_attributes(task_params)
           render :json => @task
        end
  end

  def create
    @task  = Task.new(task_params)

    if @task.save
        render :json => @task
    else
      render :json => @tasks.errors.full_messages
    end

  end

  private
    def task_params
      params.require(:task).permit(:name, :deadline, :house_id, :points, :user_id, :status)
    end
end
