FactoryBot.define do
  factory :user do
    first_name { "Aaron" }
    last_name { "Sumner" }
    username { "AS" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "dottle-nouveau-pavilion-tights-furze" }
  end
end
