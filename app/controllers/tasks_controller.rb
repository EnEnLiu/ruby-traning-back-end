class TasksController < ApplicationController
  before_action :is_login?
  before_action :find_task, only: [:edit, :update, :destroy]


  def index
    @tasks = current_user.task
  end

  def new 
    @task  = Task.new
  end

  def create
    @task  = Task.new(task_params)
    @task.save
    if @task.save
      redirect_to tasks_path, notice: '新增任務！'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice:  '更新完成'
    else 
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: '任務刪除'
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
