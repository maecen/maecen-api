require 'faker'

FactoryGirl.define do  factory :content do
    title "MyString"
    project_id 1
    cost 1
  end

  factory :user do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    password 'password'
    password_confirmation 'password'

    factory :creative do
      account_type 'creative'
      phone_number {Faker::PhoneNumber.phone_number}
    end
  end

  factory :creative_with_projects, parent: :creative do
    projects {[create(:project)]}
  end

  factory :project do
    title {Faker::Book.title}
    description {Faker::Lorem.sentence}
    category {Project.valid_categories.sample}

    after :build do |project|
      project.plans = { '800': project.title.gsub(/\s+/, "") + '_800'}
    end

    factory :invalid_project do
      cost 700.6
      category 'Hippidy Hoppidy'
    end
  end
end