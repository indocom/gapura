FactoryBot.define do
  factory :image do
    imageable { nil }
    data { "" }
    mime_type { "MyString" }
    filename { "MyString" }
  end
end
