class CreateImages < ActiveRecord::Migration
  def change
    create_table :images, id: :uuid do |t|
      t.string :file
      t.uuid :space_id

      t.timestamps
    end
  end
end
