class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.paginate(page: params[:page])
  end

  def new
    @task = Task.new
  end
end
