class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :user_id, null: false
      t.integer :neighborhood_id, null: false
      t.integer :upvotes, default: 0

      t.timestamps
    end
  end
end
