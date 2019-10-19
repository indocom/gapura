admin_as_claimer = User.find_by(username: 'admin')

Customer.limit(5).each_with_index do |customer, index|
  for i in customer.tickets.count..2 do
    ticket = customer.tickets.create(
      name: "Customer#{index + 1}",
      ticket_type: i == 0 ? "MOCK" : (i == 1 ? "NIGHT" : "MATINEE"),
      booking_reference: SecureRandom.base58(5),
      purchased_at: DateTime.now,
      quantity: 10
    )

    # Add claim ticket history
    for j in 1..3 do
      ticket.claim_histories.create(
          claimed_by: admin_as_claimer.username,
          claimed_at: DateTime.now,
          claim_quantity: j
      )
    end
  end
end
