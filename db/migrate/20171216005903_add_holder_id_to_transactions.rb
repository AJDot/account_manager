class AddHolderIdToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :holder_id, :integer
  end
end
