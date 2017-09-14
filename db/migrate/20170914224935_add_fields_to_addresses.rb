class AddFieldsToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :phone_number, :string
    add_column :addresses, :verification_code, :string
    add_index :addresses, :verification_code, unique: true
    add_column :addresses, :verified, :boolean, default: false
  end
end
