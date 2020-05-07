class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    if params[:sort_expired]
      @tasks = Task.all.order(deadline: :asc)
    else
      @tasks = Task.all
    end
binding.pry
    if params[:task][:search].present?
      if params[:task][:title].present? && params[:task][:status].present?
        @tasks = Task.where("title Like ?", "%#{params[:task][:title]}%")
        # @tasks = @tasks.where(status: params[:task][:status])
      elsif params[:task][:title].present?
        @tasks = Task.where("title Like ?", "%#{params[:task][:title]}%")
      elsif params[:task][:status].present?
        @tasks = Task.where(status: params[:task][:status])
      else
        @tasks = Task.all.order(deadline: :asc)
      end
    else
      @tasks = Task.all.order(deadline: :asc)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task.id), notice: 'タスク作成しました！'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'タスクを編集しました！'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'タスクを削除しました！'
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :deadline, :status)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
