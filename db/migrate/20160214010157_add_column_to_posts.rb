class AddColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :datum, :date
  end
end
