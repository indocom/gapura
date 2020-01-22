# frozen_string_literal: true

FactoryBot.define do
  factory :admin_sponsor, class: 'Admin::Sponsor' do
    year { 1 }
    type { '' }
    name { 'MyString' }
  end
end
