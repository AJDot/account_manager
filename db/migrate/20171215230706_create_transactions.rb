class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :kind
      t.integer :amount
      t.text :description
      t.timestamps
    end
  end
end
