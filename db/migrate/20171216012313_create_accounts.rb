class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :kind
      t.integer :balance, default: 0
    end
  end
end
