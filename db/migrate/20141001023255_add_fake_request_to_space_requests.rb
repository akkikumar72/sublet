class AddFakeRequestToSpaceRequests < ActiveRecord::Migration
  def change
    add_column :space_requests, :fake_request, :boolean, :default => false
  end
end
