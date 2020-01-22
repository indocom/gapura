# frozen_string_literal: true

admin_as_claimer = User.find_by(username: 'admin')

Customer.limit(5).each_with_index do |customer, index|
  (customer.tickets.count..2).each do |i|
    ticket =
      customer.tickets.create(
        name: "Customer#{index + 1}",
        ticket_type:
          if i == 0
            # rubocop:todo Layout/ConditionPosition

            'MOCK'
          else
            (i == 1 ? 'NIGHT' : 'MATINEE')
          end,
        booking_reference: SecureRandom.base58(5),
        purchased_at: DateTime.now,
        quantity: 10
      )

    # Add claim ticket history
    (1..3).each do |j|
      ticket.claim_histories.create(
        claimed_by: admin_as_claimer.username,
        claimed_at: DateTime.now,
        claim_quantity: j
      )
    end
  end
end
