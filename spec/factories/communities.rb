FactoryBot.define do
  factory :community do
    name { "アレンジレシピ" }
    url { "https......" }
    summary { "自分オリジナルのレシピを紹介する場所です" }
    description { "材料や工程などは箇条書きでお願いします！" }
    association :user
  end
end
