FactoryBot.define do
  factory :bike do
  	image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    title { Faker::Lorem.characters(number:10) }
    user
  end
end