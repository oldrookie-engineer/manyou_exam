require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
      it '作成済みのタスクが表示される' do
        task = FactoryBot.create(:task, title: 'task')
        visit tasks_path
        expect(page).to have_content 'task'
      end
    end
  end
  describe 'タスク登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存される' do
        visit new_task_path
        fill_in 'Title', with: 'hello'
        fill_in 'Content', with: 'my name is fujimoto.'
        click_on 'button'
        expect(page).to have_content 'my name is fujimoto.'
      end
    end
  end
  describe 'タスク詳細画面' do
     context '任意のタスク詳細画面に遷移した場合' do
       before do
         @task = Task.create!(title: 'hello')
       end
       it '該当タスクの内容が表示されたページに遷移する' do
         visit task_path(@task)
         expect(page).to have_content @task.title
       end
     end
  end
end