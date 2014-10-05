class RemoveMinSizeFromSpaceRequests < ActiveRecord::Migration
  def change
    remove_column :space_requests, :min_size, :integer
    rename_column :space_requests, :max_size, :size
  end
end
