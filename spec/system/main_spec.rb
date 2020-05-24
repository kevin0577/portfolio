require "rails_helper"

RSpec.describe "ユーザー権限のテスト", type: :feature do
	let!(:user) { create(:user) }
	let!(:bike) { create(:bike) }
	context "ログインしていない場合" do
		it "マイページに遷移できない" do
			visit user_path(user.id)
			expect(current_path).to eq ("/users/sign_in")
		end
		it "ユーザー一覧に遷移できない" do
			visit users_path
			expect(current_path).to eq ("/users/sign_in")
		end
		it "プロフィール編集に遷移できない" do
			visit edit_user_path(user.id)
			expect(current_path).to eq ("/users/sign_in")
		end
		it "投稿詳細画面に遷移せできない" do
			visit bike_path(bike.id)
			expect(current_path).to eq ("/users/sign_in")
		end
		it "投稿一覧に遷移できない" do
			visit bikes_path
			expect(current_path).to eq("/users/sign_in")
		end
		it "投稿編集画面に遷移できない" do
			visit edit_bike_path(bike.id)
			expect(current_path).to eq("/users/sign_in")
		end
	end
end