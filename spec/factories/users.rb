FactoryBot.define do
  factory :user do
    pass = Faker::Internet.password(min_length: 8)
    name                  {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {pass}
    password_confirmation {pass}
  end
end