# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    created_at { '2019-08-03 12:21:35' }
    claimed_at { '2019-08-03 12:21:35' }
    user { nil }
    claim_token { '' }
    note { 'MyString' }
    receipt { 'MyString' }
  end
end
