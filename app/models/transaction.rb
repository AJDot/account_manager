class Transaction < ActiveRecord::Base
  KINDS = ['Deposit', 'Withdraw']
  belongs_to :holder
  belongs_to :account

  validates :kind, inclusion: { in: KINDS.map(&:downcase) }
  validates :amount, numericality: { greater_than_or_equal_to: 0.01 }
  validates :description, presence: true

  def amount
    read_attribute(:amount).to_f / 100
  end

  def amount=(dollars)
    write_attribute(:amount, (dollars.to_f * 100).to_i)
  end
end
