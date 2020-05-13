class LabellingsController < ApplicationController
  def create
    labelling = current_user.labellings.create(task_id: params[:task_id])
    redirect_to tasks_path, notice: 'ラベルを作成しました！'
  end

  def destroy
    labelling = current_user.labellings.find_by(id: params[:id].destroy)
    redirect_to tasks_path, notice: 'ラベルを削除しました！'
  end
end
