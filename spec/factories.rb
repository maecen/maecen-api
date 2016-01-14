require 'faker'

FactoryGirl.define do

  factory :content do
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
      zip_code {Faker::Address.zip_code}
      country {Faker::Address.country}
      nickname {Faker::Name.first_name}
      phone_number {Faker::PhoneNumber.phone_number}
    end
  end

  factory :creative_with_projects, parent: :creative do
    projects {[create(:project)]}
  end

  factory :project do
    title {Faker::Book.title}
    description {Faker::Lorem.sentence(25)}
    teaser {Faker::Lorem.sentence(10)}
    category {Project.valid_categories.sample}
    cover_image 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7'
    logo 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7'

    after :build do |project|
      project.plans = { '800': project.title.gsub(/\s+/, "") + '_800'}
    end

    factory :invalid_project do
      cost 700.6
      category 'Hippidy Hoppidy'
    end
  end
end
