class Holder < ActiveRecord::Base
  has_secure_password

  has_many :transactions
  has_many :holder_accounts
  has_many :accounts, through: :holder_accounts

  validates :password, confirmation: true
end
