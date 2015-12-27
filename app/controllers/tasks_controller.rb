class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.paginate(page: params[:page])
  end
end
