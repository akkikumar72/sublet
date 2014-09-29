class SpaceRequest < ActiveRecord::Base

  validates_presence_of :size, :city, :budget, :email
  validates :email, :email_format => true
  validates_numericality_of :size, :only_integer => true, :greater_than_or_equal_to => 1
  validates_numericality_of :budget, :greater_than_or_equal_to => 1

end

# == Schema Information
#
# Table name: space_requests
#
#  id         :integer          not null, primary key
#  size       :integer
#  city       :string(255)
#  budget     :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#
