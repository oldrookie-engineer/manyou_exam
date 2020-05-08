FactoryBot.define do
  factory :task do
    title { 'タスク２' }
    content { 'hello' }
    status { '未着手' }
  end
  factory :second_task, class: Task do
    title { 'タスク１' }
    content { 'good-bye' }
    status { '着手中' }
  end
  factory :third_task, class: Task do
    title { 'タスク３' }
    content { 'good-morning' }
    status { '完了' }
  end
end
