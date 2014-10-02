class AddColumnToNeighborhoods < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :regionid, :string
    change_column :neighborhoods, :zipcode, :string, null: true
  end
end
