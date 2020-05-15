require 'rails_helper'
RSpec.describe 'ラベル管理機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @task = FactoryBot.create(:task, user: @user)
    @second_task = FactoryBot.create(:second_task, user: @user)
    @label3 = FactoryBot.create(:label, name: 'label:3')
    @label4 = FactoryBot.create(:label, name: 'label:4')
    visit new_session_path
    fill_in 'session[email]', with: @user.email
    fill_in 'session[password]', with: @user.password
    click_on 'ログインする'
  end
  describe 'タスク登録画面' do
    context 'タスクを作成時にラベルを選択する場合' do
      it 'ラベルが表示される' do
        visit new_task_path
        fill_in 'タイトル', with: 'hello'
        fill_in '内容', with: 'my name is fujimoto.'
        select '2020', from: 'task[timelimit(1i)]'
        select '5月', from: 'task[timelimit(2i)]'
        select '9', from: 'task[timelimit(3i)]'
        select '未着手', from: status
        select '高', from: 'task[priority]'
        page.check 'task[label_ids][]', match: :first
        sleep 1.0
        click_on '登録する'
        sleep 1.0
        expect(page).to have_content 'label:1'
      end
    end
  end
  describe 'タスク一覧画面' do
    context '検索をした場合' do
      it 'ラベルで検索できる' do
        visit tasks_path
        select 'label:1', from: 'label_id'
        sleep 1.0
        click_on '検索'
        sleep 1.0
        expect(page).to have_content 'label:1'
      end
    end
  end
  describe 'ラベル登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'ラベルの登録ができる' do
        visit new_label_path
        fill_in 'label[name]', with: 'my label'
        sleep 2.0
        click_on '登録する'
        sleep 2.0
        expect(page).to have_content 'my label'
      end
    end
  end
  describe 'タスク編集画面' do
    context 'タスクを編集する場合' do
      it 'ラベルの編集ができる' do
        visit edit_task_path(@task)
        page.uncheck 'task[label_ids][]', match: :first
        find(:xpath, "(//input[@type='checkbox'])[4]").click
        sleep 1.0
        click_on '更新する'
        sleep 2.0
        expect(page).to have_content "label:4"
      end
    end
  end
end
