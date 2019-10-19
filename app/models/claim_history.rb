class ClaimHistory < ApplicationRecord
  belongs_to :ticket, inverse_of: :claim_histories

  validate :total_claim_cannot_exceed_quantity, on: :create

  private
    def total_claim_cannot_exceed_quantity
      if (ticket.total_unclaimed < claim_quantity)
        errors.add(:claim_quantity, "can't exceed remaining quantity")
      end
    end
end
