class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:show]
  before_action :login_control, only: [:new]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), notice: 'ユーザー登録しました！'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  # def edit
  #   @user = User.find(params[:id])
  # end
  #
  # def update
  #   @user = User.find(params[:id])
  #   if @user.update(user_params)
  #     redirect_to admin_users_path, notice: 'ユーザーを編集しました！'
  #   else
  #     redirect_to edit_admin_user_path(@user.id)
  #   end
  # end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
