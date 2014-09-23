class CreateSpaceRequests < ActiveRecord::Migration
  def change
    create_table :space_requests do |t|
      t.integer :size
      t.string :city
      t.string :budget
      t.string :email

      t.timestamps
    end
  end
end
