class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.paginate(page: params[:page])
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

  private

    def task_params
      params.require(:task).permit(:title, :priority, :deadline, :description)
    end
end
