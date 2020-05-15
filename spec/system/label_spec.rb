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
end
