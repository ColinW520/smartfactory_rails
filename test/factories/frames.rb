# Read about factories at https://github.com/thoughtbot/factory_girl

#associates a frame with a brand that it creates via the brands factory test (brands.rb)
FactoryGirl.define do
  factory :frame do
    name 'Moonlander'
    brand
  end
end