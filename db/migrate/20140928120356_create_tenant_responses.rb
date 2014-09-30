class CreateTenantResponses < ActiveRecord::Migration
  def change
    create_table :tenant_responses do |t|
      t.integer :space_id
      t.string :email
      t.text :description

      t.timestamps
    end
    add_index :tenant_responses, :space_id
  end
end
