class Admin::UsersController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
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

  end

  def edit

  end

  def update
    if @user.update(admin_params)
      redirect_to admin_users_path, notice: 'ユーザーを編集しました！'
    else
      render :edit
    end 
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: 'ユーザーを削除しました！'
  end

  private
  def admin_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_admin
    @user = User.find(params[:id])
  end

end
