# == Schema Information
#
# Table name: spaces
#
#  id          :uuid             not null, primary key
#  title       :string(255)
#  price       :integer
#  size        :integer
#  description :text
#  address     :string(255)
#  zipcode     :integer
#  email       :string(255)
#  active      :boolean
#  created_at  :datetime
#  updated_at  :datetime
#  slug        :string(255)
#

require 'test_helper'

class SpaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
