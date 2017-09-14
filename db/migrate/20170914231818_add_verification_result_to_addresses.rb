class AddVerificationResultToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :verification_result, :jsonb
  end
end
