class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.string :title
      t.text :description
      t.integer :admin_id

      t.timestamps null: false
    end
  end
end
