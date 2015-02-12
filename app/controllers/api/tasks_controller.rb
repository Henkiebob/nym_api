class API::TasksController < ApplicationController

  before_filter :restrict_access
  respond_to :json

  def index
    @tasks = Task.where(:house_id => params[:house_id]).order(:deadline)

    tasks = []

    # voeg een avatar aan de taak toe als deze bestaat
    @tasks.each do |task|
        temp_tasks = {}
        temp_tasks[:task] = task

        if task.user_id
          user = User.find_by_id(task.user_id)
          temp_tasks[:avatar] = user.avatar
        end

        tasks << temp_tasks
    end

    render :json => tasks
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

  def destroy
    @task = Task.find(params[:id])

    if @task
        @task.destroy
        render :json => @task
    else
        render :json => "No task found"
    end
  end

  private
    def task_params
      params.require(:task).permit(:name, :deadline, :duration, :house_id, :points, :user_id, :status)
    end
end
