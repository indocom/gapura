# frozen_string_literal: true

FactoryBot.define do
  factory :admin_testimony, class: 'Admin::Testimony' do
    name { 'MyString' }
    profession { 'MyString' }
    testimony { 'MyText' }
  end
end
