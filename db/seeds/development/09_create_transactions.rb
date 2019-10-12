for i in Transaction.count..4 do
  Transaction.create(
    name: "Transaction#{i + 1}",
    email: "Transaction#{i + 1}@gmail.com",
    ticket_type: "Mock",
    booking_reference: SecureRandom.base64(5),
    purchased_at: DateTime.now,
    created_at: DateTime.now,
    quantity: 10
  )
end
