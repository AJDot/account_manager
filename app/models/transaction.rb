class Transaction < ActiveRecord::Base
  belongs_to :holder
  belongs_to :account
end
