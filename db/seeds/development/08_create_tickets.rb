Customer.limit(5).each_with_index do |customer, index|
  for i in customer.tickets.count..2 do
    customer.tickets.create(
      name: "Customer#{index + 1}",
      ticket_type: "Mock",
      booking_reference: SecureRandom.base64(5),
      purchased_at: DateTime.now,
      quantity: 10
    )
  end
end
