class CreateHolderAccounts < ActiveRecord::Migration
  def change
    create_table :holder_accounts do |t|
      t.integer :holder_id, :account_id
      t.timestamps
    end
  end
end
