class AddAttachmentImageToSliderImages < ActiveRecord::Migration
  def self.up
    change_table :slider_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :slider_images, :image
  end
end
