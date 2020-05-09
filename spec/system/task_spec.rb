require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  # before do
  #   @task = FactoryBot.create(:task, title: 'task')
  # end
  before do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end
  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
      it '作成済みのタスクが表示される' do
        # task = FactoryBot.create(:task, title: 'task')
        visit tasks_path
        expect(page).to have_content 'タスク１'
      end
    end
    context '複数のタスクを作成した場合' do
      it 'タスクが作成日時の降順に並んでいる' do
        # あらかじめタスク並び替えの確認テストで使用するためのタスクを二つ作成する
        # （上記と全く同じ記述が繰り返されてしまう！）
        # task = FactoryBot.create(:task, title: 'task')
        # new_task = FactoryBot.create(:task, title: "new_task")
        visit tasks_path
        task_list = all('#task_row')# タスク一覧を配列として取得するため、View側でidを振っておく
        expect(task_list[0]).to have_content 'タスク２'
        expect(task_list[1]).to have_content 'タスク１'
      end
    end
    context '終了期限でソートした場合' do
      it 'タスクが終了期限順に並んでいる' do
        visit tasks_path
        click_on '終了期限でソートする'
        task_limit = all('#task_limit')
        expect(task_limit[0]).to have_content '2020-05-09'
        expect(task_limit[1]).to have_content '2020-05-10'
      end
    end
  end
  describe 'タスク登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存される' do
        visit new_task_path
        fill_in 'タイトル', with: 'hello'
        fill_in '内容', with: 'my name is fujimoto.'
        select '2020', from: 'task[timelimit(1i)]'
        select '5月', from: 'task[timelimit(2i)]'
        select '9', from: 'task[timelimit(3i)]'
        select '未着手', from: status
        select '高', from: 'task[priority]'
        click_on '登録する'
        expect(page).to have_content 'my name is fujimoto.'
        expect(page).to have_content '未着手'
        expect(page).to have_content '高'
        expect(page).to have_content '2020-05-09'
      end
    end
  end
  describe 'タスク詳細画面' do
     context '任意のタスク詳細画面に遷移した場合' do
       before do
         @task = Task.create!(title: 'hello', content:'my name is fujimoto.')
       end
       it '該当タスクの内容が表示されたページに遷移する' do
         visit task_path(@task)
         expect(page).to have_content @task.title
       end
     end
  end
end

RSpec.describe 'タスク検索機能', type: :system do
  context '検索をした場合' do
    before do
      FactoryBot.create(:task)
      FactoryBot.create(:second_task)
      FactoryBot.create(:third_task)
    end
    it "タイトルで検索できる" do
      visit tasks_path
      # タスクの検索欄に検索ワードを入力する (例: task)
      fill_in 'title', with: 'タスク２'
      # 検索ボタンを押す
      click_on '検索'
      expect(page).to have_content 'hello'
    end
    it "ステータスで検索できる" do
      visit tasks_path
      # タスクの検索欄に検索ワードを入力する (例: task)
      select '着手中', from: status
      # 検索ボタンを押す
      click_on '検索'
      expect(page).to have_content 'good-bye'
    end
    it "タイトルとステータスで検索できる" do
      visit tasks_path
      # タスクの検索欄に検索ワードを入力する (例: task)
      fill_in 'title', with: 'タスク３'
      select '完了', from: status
      # 検索ボタンを押す
      click_on '検索'
      expect(page).to have_content 'good-morning'
    end
  end
end
