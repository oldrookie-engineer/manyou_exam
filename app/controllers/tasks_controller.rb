class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    # 終了期限順・優先順位順にソートするコード
    if params[:sort_deadline]
      @tasks = Task.all.page(params[:page]).per(5).deadline_order
    elsif params[:sort_priority]
      @tasks = Task.all.page(params[:page]).per(5).order(priority: :asc)
    else
      @tasks = Task.all.page(params[:page]).per(5)
    end

    # ----- 検索機能のコード -----
    if params[:search].present?
      # ----- タイトルとステータスの検索 -----
      if params[:title].present? && params[:status].present?
        @tasks = Task.title_search(params[:title])
        .status_search(params[:status])
        @tasks = @tasks.page(params[:page]).per(5)
      # ----- タイトルの検索 -----
      elsif params[:title].present?
        @tasks = Task.title_search(params[:title])
        @tasks = @tasks.page(params[:page]).per(5)
      # ----- ステータスの検索 -----
      elsif params[:status].present?
        @tasks = Task.status_search(params[:status])
        @tasks = @tasks.page(params[:page]).per(5)
      # else
      #   @tasks = Task.all
      end
    # else
    #   @tasks = Task.all
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
    params.require(:task).permit(:title, :content, :deadline, :status, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
