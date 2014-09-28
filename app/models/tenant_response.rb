class TenantResponse < ActiveRecord::Base

  belongs_to :space

  validates_presence_of :email, :description
end

# == Schema Information
#
# Table name: tenant_responses
#
#  id          :integer          not null, primary key
#  space_id    :integer
#  email       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#
