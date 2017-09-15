class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.belongs_to :itemable, polymorphic: true
      t.string :title
      t.integer :quantity
      t.string :unit_of_measure
      t.money :unit_price

      t.timestamps
    end
  end
end
