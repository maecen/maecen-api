FactoryGirl.define do
  sequence(:name)  { |n| "Person#{n}" }
  sequence(:email) { |n| "person#{n}@example.com" }

  factory :user do
    name
    email
    password 'password'
    password_confirmation 'password'

    factory :creative do
      type 'creative'
    end
  end
end