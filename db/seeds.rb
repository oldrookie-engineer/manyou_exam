User.create!(
  name: "master",
  email: "1234@abcd.com",
  password: "adminmaster",
  password_confirmation: "adminmaster",
  admin: true)

10.times do |n|
  User.create!(
    name: "test#{n}",
    email: "example#{n}@dic.com",
    password: "password#{n}",
    password_digest: "password#{n}"
  )
end

10.times do |n|
  Task.create!(
    title: "title#{n}",
    content: "content#{n}",
    status: "着手中",
    priority: "高",
    timelimit: 2020-05-15
  )
end

10.times do |n|
  Label.create!(name:"label: #{n}")
end
