class SpaceRequest < ActiveRecord::Base

  validates_presence_of :size, :city, :email
  validates_numericality_of :size, :only_integer => true, :greater_than_or_equal_to => 1
  validates_numericality_of :budget, :greater_than_or_equal_to => 1, :allow_blank => true, :unless => lambda{ |a| a.budget.blank? }
  validates :email, :email_format => true, :unless => lambda{ |a| a.email.blank? }

  after_commit :send_email_to_admin, on: :create

  def send_email_to_admin
    UserMailer.send_email_new_space_request(self).deliver unless fake_request
  end

  def self.create_dummy_request_spaces
    2.times do
      space_request = SpaceRequest.new
      space_request.size = (500..700).to_a.sample
      space_request.city = Faker::Address.city
      space_request.budget = [1,2,3].sample
      space_request.email = Faker::Internet.email
      space_request.fake_request = true
      space_request.save
    end
  end

  def budget_type
    budget == "1" ? "Low" : budget == "2" ? "Medium" : "High"
  end

end

# == Schema Information
#
# Table name: space_requests
#
#  id           :integer          not null, primary key
#  size         :integer
#  city         :string(255)
#  budget       :string(255)
#  email        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  fake_request :boolean          default(FALSE)
#
