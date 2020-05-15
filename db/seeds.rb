# User.create!(
#   name: 'fujimoto',
#   email: 'abc@def.com',
#   password_digest: 'lovenakano'
# )

# User.create!(
#   name: "master",
#   email: "1234@abcd.com",
#   password: "yohei",
#   password_confirmation: "yohei",
#   admin: true)

10.times do |n|
  Label.create!(name:"label: #{n}")
end

# 20.times do |n|
#   name = Faker::Name.name
#   email = "example-#{n+1}@example.com"
