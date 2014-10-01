class CreateNeighborhoodPhotos < ActiveRecord::Migration
  def change
    create_table :neighborhood_photos do |t|
      t.string :photo
      t.boolean :approved
      t.boolean :featured
      t.integer :user_id
      t.integer :neighborhood_id

      t.timestamps
    end
  end
end
