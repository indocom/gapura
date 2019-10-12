class Customer < ApplicationRecord
  has_many :tickets, inverse_of: :customer, dependent: :nullify
end
