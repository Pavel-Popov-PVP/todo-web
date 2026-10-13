class TasksController < ApplicationController

  def index # demonstrate all tasks
    @tasks = Task.all
  end

  def show # every task got their own ID, we need to see them
    @task = Task.find(params[:id])
  end

  def new # creating a new task to our list
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to task_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:title)
  end

end