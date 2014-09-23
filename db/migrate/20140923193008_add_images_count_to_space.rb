class AddImagesCountToSpace < ActiveRecord::Migration
  def change
    add_column :spaces, :images_count, :integer, :default => 0
    Space.reset_column_information
    Space.all.each do |p|
      Space.update_counters p.id, :images_count => p.images.length
    end
  end
end
