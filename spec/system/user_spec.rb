require 'rails_helper'
RSpec.describe 'ユーザ登録・ログイン・ログアウト機能', type: :system do
  # before do
  #   @user = FactoryBot.create(:user)
  #   # @second_user = FactoryBot.create(:second_user)
  # end

  describe 'ユーザー登録のテスト' do
    context 'ユーザのデータがなくログインしていない場合' do
      # let(:user) { FactoryBot.create(:user) }
      it 'ユーザ新規登録のテスト' do
        visit new_user_path
        fill_in 'user[name]', with: 'sample'
        fill_in 'user[email]', with: 'aaa@bbb.com'
        fill_in 'user[password]', with: '00000000'
        fill_in 'user[password_confirmation]', with: '00000000'
        click_on '登録する'
        sleep 2.0
        expect(page).to have_content 'ユーザー登録しました！'
        # expect(current_path).to eq user_path(@user.id)
      end
      it 'ログインしていない時はログイン画面に飛ぶテスト' do
        visit tasks_path
        expect(current_path).to eq new_session_path
      end
    end
  end

  describe 'セッション機能のテスト' do
    before do
        @user = FactoryBot.create(:user)
    end
    context 'ユーザのデータがありログインしていない場合' do
      it 'ログインのテスト' do
        visit new_session_path
        fill_in 'session[email]', with: @user.email
        fill_in 'session[password]', with: @user.password
        click_on 'ログインする'
        sleep 2.0
        expect(page).to have_content 'ログインしました！'
      end
    end

    context 'ユーザのデータがありログインしている場合' do
      before do
        visit new_session_path
        fill_in 'session[email]', with: @user.email
        fill_in 'session[password]', with: @user.password
        click_on 'ログインする'
        sleep 2.0
      end

      it '自分のマイページに飛べる' do
        visit current_path
        expect(current_path).to eq user_path(id: @user.id)
      end

      it '他人の詳細画面に飛ぶとタスク一覧ページに遷移する' do
        visit user_path(id: 2)
        expect(current_path).to eq tasks_path
      end
    end
  end

  describe '管理画面のテスト' do
    before do
      @admin_user = FactoryBot.create(:admin_user)
    end
    context '管理者権限のデータがあり、ログインしている場合' do
      before do
        visit new_session_path
        fill_in 'session[email]', with: @admin_user.email
        fill_in 'session[password]', with: @admin_user.password
        click_on 'ログインする'
        sleep 2.0
      end

      it '管理画面にアクセスできる' do
        visit admin_users_path
        expect(current_path).to eq admin_users_path
      end
    end

    context '一般ユーザーとしてログインしている場合' do
      before do
        @user = FactoryBot.create(:user)
        visit new_session_path
        fill_in 'session[email]', with: @user.email
        fill_in 'session[password]', with: @user.password
        click_on 'ログインする'
        sleep 2.0
      end

      it '一般ユーザーは管理画面にアクセスできない' do
        visit admin_users_path
        expect(current_path).not_to eq admin_users_path
      end
    end

    context '管理者権限のデータがあり、ログインしている場合' do
      before do
        @user = FactoryBot.create(:user)
        visit new_session_path
        fill_in 'session[email]', with: @admin_user.email
        fill_in 'session[password]', with: @admin_user.password
        click_on 'ログインする'
        sleep 2.0
      end

      it 'ユーザーを新規登録できる' do
        visit new_admin_user_path
        fill_in 'user[name]', with: 'fujimoto'
        fill_in 'user[email]', with: '1111@aaaa.com'
        fill_in 'user[password]', with: 'nakano'
        fill_in 'user[password_confirmation]', with: 'nakano'
        click_on '登録する'
        sleep 2.0
        expect(page).to have_content 'ユーザーを登録しました！'
      end

      it '管理者はユーザの詳細画面にアクセスできること' do
        visit admin_user_path(id: 1)
        expect(current_path).to eq admin_user_path(id: 1)
      end

      it '管理者はユーザの編集画面からユーザを編集できること' do
        visit edit_admin_user_path(id: @user.id)
        fill_in 'user[name]', with: 'edit'
        click_on '更新する'
        sleep 2.0
        expect(page).to have_content 'ユーザーを編集しました！'
      end

      it '管理者はユーザを削除できること' do
        visit admin_users_path
        first(:link, '削除').click
        expect(page.accept_confirm).to eq "本当に削除していいですか？"
        expect(page).to have_content 'ユーザーを削除しました！'
      end
    end
  end
end
