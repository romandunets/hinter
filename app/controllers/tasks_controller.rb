class TasksController < ApplicationController
  before_action :logged_in_user
  before_filter :load_task, only: [:show, :edit, :update, :destroy, :start, :close, :toggle_state]

  def index
    @tasks = current_user.tasks.paginate(page: params[:page])
  end

  def show
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
  end

  def update
    if @task.update_attributes(task_params)
      flash[:success] = "Task was successfully updated."
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    flash[:success] = "Task was successfully deleted."
    redirect_to tasks_url
  end

  def start
    @task.start
    redirect_to @task
  end

  def close
    @task.close
    redirect_to @task
  end

  def toggle_state
    @task.toggle_state
    redirect_to :back
  end

  private

    def task_params
      params.require(:task).permit(:title, :priority, :deadline, :description)
    end

    def load_task
      @task = Task.find(params[:id])
    end
end
