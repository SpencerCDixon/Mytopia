class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :city, null: false
      t.string :state, null: false
      t.string :zipcode, null: false
      t.string :name

      t.timestamps
    end
  end
end
