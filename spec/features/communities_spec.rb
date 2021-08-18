require 'rails_helper'

RSpec.feature "Communities", type: :feature do
  # 新しいコミュニティを作る
  describe "create community function" do
    before do
      user = FactoryBot.create(:user)
      visit root_path
      find('#header_sign_in').click #ログインボタンをクリック
      fill_in "Eメール", with: user.email
      fill_in "パスワード", with: user.password
      click_button "ログイン"
    end

    context "with valid attributes" do
      before do
        visit communities_path
        click_link "コミュニティを作成する"
        fill_in "コミュニティ名", with: "アレンジレシピ"
        fill_in "概要", with: "自分オリジナルのレシピを紹介する場所です"
        fill_in "URL", with: "https......"
        fill_in "ルール", with: "材料や工程などは箇条書きでお願いします！"
        click_button "作成"
      end

      it "display successful flash messages" do
        expect(page).to have_content "コミュニティ「アレンジレシピ」が作成されました！"
      end
    end

    context "with invalid attributes" do
      before do
        visit communities_path
        click_link "コミュニティを作成する"
        fill_in "コミュニティ名", with: ""
        fill_in "概要", with: "自分オリジナルのレシピを紹介する場所です"
        fill_in "URL", with: "https......"
        fill_in "ルール", with: "材料や工程などは箇条書きでお願いします！"
        click_button "作成"
      end
      
      it "display error flash messages" do
        expect(page).to have_content "コミュニティ名を入力してください"
      end
    end
  end
end
