class AddNullFalseForeignKeysNeighborhoodPhotos < ActiveRecord::Migration
  def change
    change_column :neighborhood_photos, :user_id, :integer, :null => false
    change_column :neighborhood_photos, :neighborhood_id, :integer, :null => false
  end
end
