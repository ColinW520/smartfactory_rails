# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    customer_name 'Sally Jones'
    customer_email 'sally@jones.com'
    description 'Fancy order'
    price 1600
    frame
  end
end