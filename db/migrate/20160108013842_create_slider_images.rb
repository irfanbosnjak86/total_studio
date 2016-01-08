class CreateSliderImages < ActiveRecord::Migration
  def change
    create_table :slider_images do |t|
      t.integer :simage_id
      t.references :slider, index: true

      t.timestamps null: false
    end
    add_foreign_key :slider_images, :sliders
  end
end
