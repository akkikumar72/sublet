class SpaceRequest < ActiveRecord::Base

  validates_presence_of :max_size, :min_size, :city, :email
  validates_numericality_of :min_size, :only_integer => true, :greater_than_or_equal_to => 1, :unless => lambda{ |a| a.min_size.blank? }
  validates_numericality_of :max_size, :only_integer => true, :greater_than_or_equal_to => 1, :unless => lambda{ |a| a.max_size.blank? }
  validates_numericality_of :budget, :greater_than_or_equal_to => 1, :allow_blank => true, :unless => lambda{ |a| a.budget.blank? }
  validates :email, :email_format => true, :unless => lambda{ |a| a.email.blank? }

  after_commit :send_email_to_admin, on: :create

  def send_email_to_admin
    unless fake_request
      UserMailer.delay.send_email_new_space_request(self)
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
