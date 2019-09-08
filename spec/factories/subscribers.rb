FactoryBot.define do
  factory :subscriber do
    name { "MyString" }
    email { "MyString" }
    receive_important_email { false }
    receive_unimportant_email { false }
  end
end
