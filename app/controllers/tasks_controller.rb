class TasksController < ApplicationController

  def index # demonstrate all tasks
    order = params[:order] == "asc" ? :asc : :desc
    @tasks = Task.order(id: order)
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

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to @task
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path, status: :see_other
  end

  def toggle
    @task = Task.find(params[:id])
    @task.update(is_completed: !@task.is_completed)
    redirect_to root_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title)
  end

end