class Account < ActiveRecord::Base
  has_many :transactions
  has_many :holder_accounts
  has_many :holders, through: :holder_accounts
end
