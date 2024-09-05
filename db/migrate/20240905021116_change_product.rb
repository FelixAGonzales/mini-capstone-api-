class ChangeProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :item_count, :integer
    change_column :products, :description, :text
    change_column :products, :price, :decimal, precision: 10, scale: 2
  end
end
