class TasksController < ApplicationController

  def index # demonstrate all tasks
    @tasks = Task.all
  end

  def show # every task got their own ID, we need to see them
    @task = Task.find(params[:id])
  end

end