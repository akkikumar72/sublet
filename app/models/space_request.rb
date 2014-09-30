class SpaceRequest < ActiveRecord::Base

  validates_presence_of :max_size, :min_size, :city, :email
  validates_numericality_of :max_size, :min_size, :only_integer => true, :greater_than_or_equal_to => 1
  validates_numericality_of :budget, :greater_than_or_equal_to => 1, :allow_blank => true
  validates :email, :email_format => true

end

# == Schema Information
#
# Table name: space_requests
#
#  id         :integer          not null, primary key
#  max_size   :integer
#  city       :string(255)
#  budget     :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  min_size   :integer
#
