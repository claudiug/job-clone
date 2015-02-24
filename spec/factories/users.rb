# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "foo"
    email "email@example.net"
    password "foobaz123"
  end
end
