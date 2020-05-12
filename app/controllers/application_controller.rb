class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def authenticate_user
    if logged_in? == false
      redirect_to new_session_path, notice: 'ログインしてください！'
    end
  end

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to tasks_path, notice: '他ユーザーへのアクセスは、ログイン権限外です！'
    end
  end

  def login_control
    if session[:user_id]
      redirect_to tasks_path, notice: 'ログイン中です！'
    end
  end

end
