class Transaction < ActiveRecord::Base
  KINDS = ['Deposit', 'Withdraw']
  belongs_to :holder
  belongs_to :account

  validates :kind, inclusion: { in: KINDS.map(&:downcase) }
  validates :amount, numericality: { greater_than_or_equal_to: 0.01 }
  validates :description, presence: true
end
