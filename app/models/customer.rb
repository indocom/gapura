class Customer < ApplicationRecord
  has_secure_token :claim_token
  has_many :tickets, inverse_of: :customer, dependent: :nullify
end
