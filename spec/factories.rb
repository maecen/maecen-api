require 'faker'

FactoryGirl.define do
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

  factory :project do
    title {Faker::Book.title}
    description {Faker::Lorem.sentence}
    cost 800
    category {Project.valid_categories.sample}

    factory :invalid_project do
      cost 700.6
    end
  end
end