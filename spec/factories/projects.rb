# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :orphan_project, class: Project do
  end

  factory :project, parent: :orphan_project do
    after(:create) {|p|
      create(:owner_membership, project: p)
    }
  end
end
