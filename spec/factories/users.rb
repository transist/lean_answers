# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "user_#{n}" }
    email { "#{name}@transi.st" }
    password 'password'
  end
end
