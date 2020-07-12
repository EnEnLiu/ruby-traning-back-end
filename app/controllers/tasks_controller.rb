class TasksController < ApplicationController
  before_action :is_login?
  before_action :find_task, only: [:edit, :update, :destroy]
  http_basic_authenticate_with name: "name", password: "password", except: :index

  def index
    @tasks = current_user.tasks.order(created_at: :desc)
  end

  def new
    @task  = Task.new
  end

  def create
    @task  = Task.new(task_params)
    @task.save
    if @task.save
      redirect_to tasks_path, notice: 'Created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice:  'Updated!'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Deleted!'
  end

  private
  def task_params
    params.require(:task).permit(:title,
                                 :content,
                                 :user_id,
                                 :priority,
                                 :status,
                                 :start_at,
                                 :end_at)
  end

  def find_task
    @task = Task.find_by(id: params[:id])
  end
end
