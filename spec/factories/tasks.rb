FactoryBot.define do
  factory :task do
    title { 'タスク２' }
    content { 'hello' }
    deadline { '2020-05-08' }
    status { '未着手' }
    priority { '高' }
  end
  factory :second_task, class: Task do
    title { 'タスク１' }
    content { 'good-bye' }
    deadline { '2020-05-09' }
    status { '着手中' }
    priority { '中' }
  end
  factory :third_task, class: Task do
    title { 'タスク３' }
    content { 'good-morning' }
    deadline { '2020-05-10' }
    status { '完了' }
    priority { '低' }
  end
end
