class AddStateFullnameToNeighborhoods < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :state_fullname, :string
  end
end
