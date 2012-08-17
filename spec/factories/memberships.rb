# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :membership do
    user
    association :project, factory: :orphan_project
  end

  factory :owner_membership, parent: :membership  do
    membership_type 'Owner'
  end
end
