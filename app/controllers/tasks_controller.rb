class TasksController < ApplicationController

  # if I don't specify which action needs authentication (only)
  # will it default to requiring authentication on all controller actions?
  before_action :authenticate_user, only: [:index, :show, :new, :create, :edit, :update, :delete]

  def index
    @tasks = Task.includes(:category).where(user_id: current_user.id)
  end

  def show
    task_find(params[:id])
  end

  def new
    @categories = Category.all.pluck(:name, :id)
    @priorities = Priority.all.pluck(:name, :id)
    @statuses = Status.all.pluck(:name, :id)

    default_status = Status.first
    default_priority = Priority.first

    @task = Task.new(
      status_id: Status.first&.id,
      priority_id: Priority.first&.id,
      category_id: params[:category_id],
      user_id: current_user.id
    )
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    if @task.save
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def edit
    task_find(params[:id])
  end

  def update
    if task_find(params[:id]).update(task_params)
      redirect_to task_path(id: @task.id)
    else
      render 'edit'
    end
  end

  def delete
    task_find(params[:id])
  end

  def destroy
    task_find(params[:id]).destroy
    redirect_to tasks_path(category_id: @task.category_id)
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :category_id ,:priority_id, :status_id, :user_id, :due_date)
  end

  private
  def task_find(id)
    @task = Task.includes(:category).includes(:priority).includes(:status).find(id)
  end
end