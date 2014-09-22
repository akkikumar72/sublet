# == Schema Information
#
# Table name: images
#
#  id         :uuid             not null, primary key
#  file       :string(255)
#  space_id   :uuid
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
