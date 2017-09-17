class AddUlidToInvoices < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :unique_code, :string
    add_index :invoices, :unique_code, unique: true
  end
end
