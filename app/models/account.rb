class Account < ActiveRecord::Base
  KINDS = ['Checking', 'Savings']

  has_many :transactions
  has_many :holder_accounts
  has_many :holders, through: :holder_accounts

  validates :name, presence: :true
  validates :kind, inclusion: { in: KINDS.map(&:downcase) }
end
