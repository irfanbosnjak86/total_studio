class CreatePostImages < ActiveRecord::Migration
  def change
    create_table :post_images do |t|
      t.string :caption
      t.integer :post_id
      t.references :post, index: true

      t.timestamps null: false
    end
    add_foreign_key :post_images, :posts
  end
end
