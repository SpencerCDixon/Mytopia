class AddFeatureTrueFalsePhotoToNeighborhoods < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :photo, :string
    add_column :neighborhoods, :feature, :boolean
  end
end
