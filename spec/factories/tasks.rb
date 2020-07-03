FactoryBot.define do
  factory :task do
    user
    title { Faker::Verb.base }
  end
end
