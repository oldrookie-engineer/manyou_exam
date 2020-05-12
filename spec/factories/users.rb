FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'sample' }
    email { 'aaa@bbb.com' }
    password { '00000000' }
    password_confirmation { '00000000' }
    admin { false }
  end
  factory :second_user do
    id { 2 }
    name { 'samplesample' }
    email { 'a@b.com' }
    password { '0000' }
    password_confirmation { '0000' }
    admin { false }
  end
  factory :admin_user, class: User do
    id { 2 }
    name { 'admin' }
    email { 'admin@sample.com' }
    password { 'admin' }
    admin { true }
  end
end
