class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.integer :slider_id
      t.string :slider_name

      t.timestamps null: false
    end
  end
end
