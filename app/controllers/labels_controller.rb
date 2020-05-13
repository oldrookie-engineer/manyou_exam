class LabelsController < ApplicationController
  before_action :set_label, only: [:show, :edit, :update, :destroy]
  def index
    @labels = Label.all
  end

  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to tasks_path, notice: 'ラベルを作成しました！'
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @label.update(label_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @label.destroy
    redirect_to tasks_path
  end

  private
  def label_params
    params.require(:label).permit(:name)
  end

  def set_label
    @label = Label.find(params[:id])
  end
end
