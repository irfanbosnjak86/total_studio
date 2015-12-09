class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :url
      t.integer :post_id
      t.references :post, index: true

      t.timestamps null: false
    end
    add_foreign_key :videos, :posts
  end
end
