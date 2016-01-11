class AddColumnToSliders < ActiveRecord::Migration
  def change
    add_column :sliders, :admin_id, :integer
  end
end
