FactoryBot.define do
  factory :post do
    title { "ふわふわオムレツを作ってみた" }
    body { "材料・マヨネーズ" }
    association :user
    association :community
  end
end
