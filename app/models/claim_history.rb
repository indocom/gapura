class ClaimHistory < ApplicationRecord
  belongs_to :ticket, inverse_of: :claim_histories
end
