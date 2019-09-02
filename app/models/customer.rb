class Customer < ApplicationRecord
  has_secure_token :claim_token
end
