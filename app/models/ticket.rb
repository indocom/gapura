class Ticket < ApplicationRecord
  belongs_to :user
  has_secure_token :claim_token
end
