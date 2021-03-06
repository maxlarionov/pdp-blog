# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title 'MyString'
    body 'MyText'
    published true
    association :user
  end

  factory :private_post, parent: :post do
    published false
  end
end
