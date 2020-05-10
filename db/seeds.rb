# User.create!(
#   name: 'fujimoto',
#   email: 'abc@def.com',
#   password_digest: 'lovenakano'
# )

User.create!(
  name: "管理者",
  email: "1234@abcd.com",
  password: "yohei",
  password_confirmation: "yohei",
  admin: true)
