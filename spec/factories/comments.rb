FactoryBot.define do
  factory :comment do
    message { "γγΎγγ" }
    association :user
    association :post
  end
end
