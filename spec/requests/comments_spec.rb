require 'rails_helper'

RSpec.describe "Comments", type: :request do
  #コメント削除機能
  describe "delete comment" do
    #ログインしてるユーザーが別のユーザーのコメントを消そうとしている
    context "if logged in user deletes another user" do
      before do
        @user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:user)
        @comment = FactoryBot.create(:comment, user: other_user)
      end

      # プロジェクトを削除できないこと
      it "does not delete comment" do
        sign_in @user
        expect {
          delete comment_path(@comment), params: { id: @comment.id }
        }.to_not change(Comment, :count)
      end
    end
  end
end
