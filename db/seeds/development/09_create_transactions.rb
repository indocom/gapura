# frozen_string_literal: true

(Transaction.count..4).each do |i|
  Transaction.create(
    name: "Transaction#{i + 1}",
    email: "Transaction#{i + 1}@gmail.com",
    ticket_type: 'Mock',
    booking_reference: SecureRandom.base58(5),
    purchased_at: DateTime.now,
    created_at: DateTime.now,
    quantity: 10
  )
end
