FactoryBot.define do
  factory :comment do
    message { "うまそう" }
    association :user
    association :post
  end
end
