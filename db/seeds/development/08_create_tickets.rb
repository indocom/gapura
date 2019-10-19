Customer.limit(5).each_with_index do |customer, index|
  for i in customer.tickets.count..2 do
    customer.tickets.create(
      name: "Customer#{index + 1}",
      ticket_type: i == 0 ? "MOCK" : (i == 1 ? "NIGHT" : "MATINEE"),
      booking_reference: SecureRandom.base58(5),
      purchased_at: DateTime.now,
      quantity: (i == 1 ? 1 : 2)
    )
  end
end
