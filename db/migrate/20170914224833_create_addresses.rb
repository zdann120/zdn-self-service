class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :token
      t.references :user, foreign_key: true
      t.string :nickname
      t.string :line1
      t.string :line2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
    add_index :addresses, :token, unique: true
  end
end
