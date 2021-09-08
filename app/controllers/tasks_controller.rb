class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def find
    @tasks = Task.find(params[:id])
    if @tasks.completed? == true
      @true = 'This task is completed'
    else
      @false = 'This task is not completed'
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
