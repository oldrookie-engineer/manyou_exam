FactoryBot.define do
  factory :task do
    title { 'タスク２' }
    content { 'hello' }
  end
  factory :second_task, class: Task do
    title { 'タスク１' }
    content { 'good-bye' }
  end
end
