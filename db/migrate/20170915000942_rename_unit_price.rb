class RenameUnitPrice < ActiveRecord::Migration[5.1]
  def change
    remove_column :line_items, :unit_price, :money
  end
end
