class AddDefaultAddressToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :default_address_id, :integer
  end
end
