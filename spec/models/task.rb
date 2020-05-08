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
    expect(task).to be_valid  end
context 'scopeメソッドで検索した場合' do
  before do
    Task.create(title: "task", content: "sample_task")
    Task.create(title: "sample", content: "sample_sample")
  end
  it "scopeメソッドでタイトル検索ができる"
  expect(Task.title_search('task').count).to eq 1
end
end
