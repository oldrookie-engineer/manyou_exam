User.create!(
  name: "master",
  email: "12@ab.com",
  password: "adminmaster",
  password_confirmation: "adminmaster",
  admin: true)

3.times do |n|
  User.create!(
    name: "test#{n}",
    email: "example#{n}@test.com",
    password: "password#{n}",
    password_confirmation: "password#{n}"
  )
end

  Task.create!(
    title: "課題１",
    content: "万葉step1",
    status: "完了",
    priority: "高",
    timelimit: 2020-05-08,
    user_id:1
  )

  Task.create!(
    title: "課題２",
    content: "万葉step2",
    status: "着手中",
    priority: "高",
    timelimit: 2020-05-10,
    user_id:2
  )

  Task.create!(
    title: "課題３",
    content: "万葉step3",
    status: "未着手",
    priority: "高",
    timelimit: 2020-05-15,
    user_id:3
  )


5.times do |n|
  Label.create!(name:"label: #{n}")
end
