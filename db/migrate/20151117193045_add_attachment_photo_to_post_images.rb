class AddAttachmentPhotoToPostImages < ActiveRecord::Migration
  def self.up
    change_table :post_images do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :post_images, :photo
  end
end
