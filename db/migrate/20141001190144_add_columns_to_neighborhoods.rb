class AddColumnsToNeighborhoods < ActiveRecord::Migration
  def change
    add_column :neighborhood_photos, :featured, :boolean, default: false
    add_column :neighborhood_photos, :approved, :boolean, default: false
  end
end
