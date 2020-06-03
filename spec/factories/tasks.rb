FactoryBot.define do
  factory :task do
    content {Faker::Lorem.sentence}
    user
    group
  end
end