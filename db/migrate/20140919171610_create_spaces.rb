class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces, id: :uuid do |t|
      t.string :title
      t.integer :price
      t.integer :size
      t.text :description
      t.string :address
      t.integer :zipcode
      t.string :email
      t.boolean :active

      t.timestamps
    end
  end
end
