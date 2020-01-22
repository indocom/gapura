# frozen_string_literal: true

(Customer.count..4).each do |i|
  Customer.create(email: "Customer#{i + 1}@gmail.com")
end
