class SpaceRequest < ActiveRecord::Base
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
