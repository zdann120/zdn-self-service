class AddUnitPriceCentsToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :unit_price_cents, :integer
  end
end
