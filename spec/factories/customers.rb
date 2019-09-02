FactoryBot.define do
  factory :customer do
    email { "MyString" }
    claim_token { "" }
    subscribe { false }
  end
end
