class TasksController < ApplicationController
  before_action :logged_in_user

  def index
    @tasks = current_user.tasks.paginate(page: params[:page])
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:info] = "Task was successfully created."
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = "Task was successfully updated."
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    flash[:success] = "Task was successfully deleted."
    redirect_to tasks_url
  end

  private

    def task_params
      params.require(:task).permit(:title, :priority, :deadline, :description)
    end
end
