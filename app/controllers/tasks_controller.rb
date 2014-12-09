class TasksController < ApplicationController

  before_filter :logged_in!

  def index
    tasks = House.find_by_id(session[:current_house_id]).tasks

    #tasks = House.find_by_id(session[:current_house_id]).includes(:tasks).order("tasks.deadline ASC")

    tasks.sort {|a, b| a[:created_at] <=> b[:created_at]}

    #tasks.order(deadline: :asc)
    #tasks.sort_by{|e| e[:time_ago]}


    @already_signed_tasks = []
    @open_tasks = []

    @user_ids = []

    tasks.each do |task|

      task.users.each do |u|
        @user_ids << u.id
      end

      if @user_ids.include?(session[:user_id].to_i)
          @already_signed_tasks += [task]
          @user_ids = []
      else
        @open_tasks += [task]
      end
    end
  end

  def new
    @task = Task.new()
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to '/dashboard', :notice => "Taak"
    else
      render :new
    end
  end

  def add_user_to_task
      usertask = Userstasks.new()

      usertask.task_id = params[:task_id]
      usertask.user_id = session[:user_id]

      if usertask.save
        redirect_to tasks_path
      end
  end

  def remove_user_from_task
      usertask = Userstasks.where(user_id: session[:user_id], task_id: params[:task_id]).destroy_all
      redirect_to tasks_path
  end

  private
    def task_params
      params.require(:task).permit(:name, :house_id, :deadline, users_attributes: [ :id])
    end

end
