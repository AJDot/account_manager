class HolderAccount < ActiveRecord::Base
  belongs_to :holder
  belongs_to :account
end
