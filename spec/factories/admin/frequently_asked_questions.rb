FactoryBot.define do
  factory :admin_frequently_asked_question, class: 'Admin::FrequentlyAskedQuestion' do
    question { "MyString" }
    answer { "MyText" }
  end
end
