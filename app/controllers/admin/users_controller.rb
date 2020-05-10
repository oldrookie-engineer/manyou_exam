class Admin::UsersController < ApplicationController
  before_action :user_admin
  before_action :set_admin, only: [:show, :edit, :destroy]


  def index
      @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(admin_params)
    if @user.save
      redirect_to admin_users_path, notice: 'ユーザーを登録しました！'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(admin_params)
      redirect_to admin_users_path, notice: 'ユーザーを編集しました！'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'ユーザーを削除しました！'
  end

  private
  def admin_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_admin
    redirect_to tasks_path, notice: 'あなたは管理者ではありません！' unless current_user.admin?
  end

  def set_admin
    @user = User.find(params[:id])
  end
end
