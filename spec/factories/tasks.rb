FactoryBot.define do
  factory :task do
    title { 'タスク２' }
    content { 'hello' }
    timelimit { '2020-05-09' }
    status { '未着手' }
    priority { '高' }
    user
      after(:build) do |task|
        label = create(:label)
        task.labellings << build(:labelling, task: task, label: label)
      end
  end
  factory :second_task, class: Task do
    title { 'タスク１' }
    content { 'good-bye' }
    timelimit { '2020-05-10' }
    status { '着手中' }
    priority { '中' }
    user
    after(:build) do |task|
      label = create(:label, name: 'label:2')
      task.labellings << build(:labelling, task: task, label: label)
    end
  end
  factory :third_task, class: Task do
    title { 'タスク３' }
    content { 'good-morning' }
    timelimit { '2020-05-01' }
    status { '完了' }
    priority { '低' }
  end
end
