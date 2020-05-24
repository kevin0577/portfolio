FactoryBot.define do
  factory :bike do
    title { Faker::Lorem.characters(number:10) }
    user
  end
end