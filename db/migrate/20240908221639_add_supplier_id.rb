class AddSupplierId < ActiveRecord::Migration[7.1]
  def change
    add_column :suppliers, :supplier_id, :integer
  end
end
