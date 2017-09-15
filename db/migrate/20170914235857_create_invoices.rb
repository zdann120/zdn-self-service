class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.references :user, foreign_key: true
      t.references :address, foreign_key: true
      t.string :identifier
      t.string :token
      t.text :description
      t.date :send_date
      t.date :due_date

      t.timestamps
    end
    add_index :invoices, :token, unique: true
  end
end
