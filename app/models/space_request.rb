class SpaceRequest < ActiveRecord::Base

  validates_presence_of :max_size, :min_size, :city, :email
  validates_numericality_of :min_size, :only_integer => true, :greater_than_or_equal_to => 1, :unless => lambda{ |a| a.min_size.blank? }
  validates_numericality_of :max_size, :only_integer => true, :greater_than_or_equal_to => 1, :unless => lambda{ |a| a.max_size.blank? }
  validates_numericality_of :budget, :greater_than_or_equal_to => 1, :allow_blank => true, :unless => lambda{ |a| a.budget.blank? }
  validates :email, :email_format => true, :unless => lambda{ |a| a.email.blank? }

  after_commit :send_email_to_admin, on: :create

  def send_email_to_admin
    UserMailer.send_email_new_space_request(self).deliver unless fake_request
  end

  def self.create_dummy_request_spaces
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

# == Schema Information
#
# Table name: space_requests
#
#  id           :integer          not null, primary key
#  max_size     :integer
#  city         :string(255)
#  budget       :string(255)
#  email        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  min_size     :integer
#  fake_request :boolean          default(FALSE)
#
