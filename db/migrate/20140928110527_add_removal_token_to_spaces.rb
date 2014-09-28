class AddRemovalTokenToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :removal_token, :string
  end
end
