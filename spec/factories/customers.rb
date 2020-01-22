# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    email { 'MyString' }
    claim_token { '' }
    subscribe { false }
  end
end
