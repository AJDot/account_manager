class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :holders, :password_digest, :string
  end
end
