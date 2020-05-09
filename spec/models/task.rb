require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :model do
  it 'titleが空ならバリデーションが通らない' do
    task = Task.new(title: '', content: '失敗テスト')
    expect(task).not_to be_valid
  end
  it 'contentが空ならバリデーションが通らない' do
    task = Task.new(title: '失敗テスト', content: '')
    expect(task).not_to be_valid
  end
  it 'titleとcontentに内容が記載されていればバリデーションが通る' do
    task = Task.new(title: '成功', content: 'テスト成功')
    expect(task).to be_valid
  end
end

RSpec.describe 'タスク検索機能', type: :model do
  context 'scopeメソッドで検索をした場合' do
    before do
      Task.create(title: "task", content: "sample", status: "未着手")
      Task.create(title: "task", content: "sample", status: "未着手")
      Task.create(title: "task", content: "sample_sample", status: "着手中")
      Task.create(title: "task", content: "sample_sample_sample", status: "完了")
    end
    it "scopeメソッドでタイトル検索ができる" do
      expect(Task.title_search("task").count).to eq 4
    end
    it "scopeメソッドでステータス検索ができる" do
      expect(Task.status_search("未着手").count).to eq 2
    end
    it "scopeメソッドでタイトルとステータスの両方が検索できる" do
      expect(Task.title_search("task") && Task.status_search("未着手").count).to eq 2
    end
  end
end
