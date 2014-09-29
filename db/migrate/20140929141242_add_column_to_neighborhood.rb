class AddColumnToNeighborhood < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :county, :string
  end
end
