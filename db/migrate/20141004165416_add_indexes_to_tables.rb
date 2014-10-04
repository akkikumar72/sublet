class AddIndexesToTables < ActiveRecord::Migration
  def change
    add_index :spaces, :title
    add_index :spaces, :price
    add_index :spaces, :description
    add_index :spaces, :zipcode
    add_index :spaces, :slug
  end
end
