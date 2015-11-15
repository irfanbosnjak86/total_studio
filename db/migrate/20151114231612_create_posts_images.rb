class CreatePostsImages < ActiveRecord::Migration
  def change
    create_table :posts_images do |t|
      t.string :caption
      t.integer :post_id
      t.belongs_to :post, index: true

      t.timestamps null: false
    end
    add_foreign_key :posts_images, :post
  end
end
