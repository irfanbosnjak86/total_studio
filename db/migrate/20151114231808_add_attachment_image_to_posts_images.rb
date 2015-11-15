class AddAttachmentImageToPostsImages < ActiveRecord::Migration
  def self.up
    change_table :posts_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :posts_images, :image
  end
end
