class Image < ActiveRecord::Base
  mount_uploader :file, FileUploader

  belongs_to :space, counter_cache: true
end

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
