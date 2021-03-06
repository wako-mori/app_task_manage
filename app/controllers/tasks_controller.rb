class TasksController < ApplicationController
  before_action :set_group
  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @tasks = @group.tasks.includes(:user)
  end

  def new
    @task = Task.new
  end

  def create
    @task = @group.tasks.new(task_params)
    if @task.valid?
      @task.save
      redirect_to group_tasks_path(@group), notice: 'タスクが追加されました'
    else
      @tasks = @group.tasks.includes(:user)
      flash.now[:alert] = 'タスク名を入力してください'
      render :index
    end
  end

  def edit
  end

  def update
    @task.update(task_params)
    if @task.valid?
      @task.save
      redirect_to group_tasks_path(@group), notice: 'タスクが変更されました'
    else
      flash.now[:alert] = 'タスク名を入力してください'
      render :index
    end
  end

  def destroy
    @task.destroy
    redirect_to group_tasks_path(@group)
  end

  private

  def task_params
    params.require(:task).permit(:content, :explanation, :limit, :excution).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_task
    @task = Task.find_by(id: params[:id])
  end
end
