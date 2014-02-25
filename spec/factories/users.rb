FactoryGirl.define do
  factory :user do
    sequence :email do |index|
      "user#{index}@example.com"
    end
    password 'password123'
    password_confirmation 'password123'

    factory :me do
      email 'me@example.com'
    end
  end
end
