for i in Customer.count..4 do
  Customer.create(email: "Customer#{i + 1}@gmail.com");
end
