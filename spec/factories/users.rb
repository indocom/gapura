# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { '123456' }
    factory :admin do
      after(:create) { |user| user.add_role :admin }
      factory :superuser do
        after(:create) { |admin| admin.add_role :superuser }
      end
    end
  end
end
