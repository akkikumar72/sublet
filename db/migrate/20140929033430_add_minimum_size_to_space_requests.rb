class AddMinimumSizeToSpaceRequests < ActiveRecord::Migration
  def change
    add_column :space_requests, :min_size, :integer
    rename_column :space_requests, :size, :max_size
  end
end
