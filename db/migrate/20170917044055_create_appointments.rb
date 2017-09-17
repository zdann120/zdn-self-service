class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.string :token
      t.references :user, foreign_key: true
      t.boolean :canceled
      t.string :description
      t.datetime :starts_at
      t.integer :duration

      t.timestamps
    end
    add_index :appointments, :token, unique: true
  end
end
