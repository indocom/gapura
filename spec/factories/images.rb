# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    imageable { nil }
    data { '' }
    mime_type { 'MyString' }
    filename { 'MyString' }
  end
end
