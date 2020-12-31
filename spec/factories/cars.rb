FactoryBot.define do
  factory :car do
    make { 'MyString' }
    model { 'MyString' }
    year { 1 }
    description { 'MyText' }
    user { nil }
  end
end
