namespace :fake_data do
  desc "Create fake space requests"
  task :create_space_requests => :environment do
    5.times do
      space_request = SpaceRequest.new
      space_request.min_size = (300..450).to_a.sample
      space_request.max_size = (500..700).to_a.sample
      space_request.city = Faker::Address.city
      space_request.budget = (2000..5000).to_a.sample
      space_request.email = Faker::Internet.email
      space_request.fake_request = true
      space_request.save
    end
  end
end
