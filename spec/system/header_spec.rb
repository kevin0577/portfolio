require "rails_helper"

RSpec.describe "ヘッダーのテスト", type: :feature do
	context "ログインしていない場合" do
		before do
			visit root_path
		end
		it "タイトルが表示される" do
			expect(page).to have_content "BIKERS"
		end
		it "aboutリンクが表示される" do
			expect(page).to have_content "about"
		end
		it "ログインリンクが表示される" do
			expect(page).to have_content "ログイン"
		end
		it "新規登録リンクが表示される" do
			expect(page).to have_content "新規登録"
		end
		it "about画面に遷移する" do
			about_link = find_all("a")[1].native.inner_text
			click_link about_link
			expect(current_path).to eq (home_about_path)
		end
		it "ログイン画面に遷移する" do
			login_link = find_all("a")[2].native.inner_text
			click_link login_link
			expect(current_path).to eq (new_user_session_path)
		end
		it "新規登録画面に遷移する" do
			signup_link = find_all("a")[3].native.inner_text
			click_link signup_link
			expect(current_path).to eq (new_user_registration_path)
		end
	end

	context "ログインしている場合" do
	let!(:user) { create(:user) }
	before do
		visit new_user_session_path
		fill_in "user[email]", with: user.email
		fill_in "user[password]", with: user.password
		click_button "Log in"
	end
		it "タイトルが表示される" do
			expect(page).to have_content "BIKERS"
		end
		it "マイページリンクが表示される" do
			expect(page).to have_content "マイページ"
		end
		it "ユーザー一覧リンクが表示される" do
			expect(page).to have_content "ユーザー一覧"
		end
		it "投稿一覧リンクが表示される" do
			expect(page).to have_content "投稿一覧"
		end
		it "投稿フォームリンクが表示される" do
			expect(page).to have_content "投稿フォーム"
		end
		it "ログアウトリンクが表示される" do
			expect(page).to have_content "ログアウト"
		end
		it "マイページ画面に遷移する" do
			mypage_link = find_all("a")[1].native.inner_text
			click_link mypage_link
			expect(current_path).to eq (user_path(user))
		end
		it "ユーザー一覧画面に遷移する" do
			users_link = find_all("a")[2].native.inner_text
			click_link users_link
			expect(current_path).to eq (users_path)
		end
		it "投稿一覧画面に遷移する" do
			bikes_link = find_all("a")[3].native.inner_text
			click_link bikes_link
			expect(current_path).to eq (bikes_path)
		end
		it "投稿フォーム画面に遷移する" do
			form_link = find_all("a")[4].native.inner_text
			click_link form_link
			expect(current_path).to eq (new_bike_path)
		end
		it "ログアウトする" do
			logout_link = find_all("a")[5].native.inner_text
			click_link logout_link
			expect(current_path).to eq (root_path)
		end
	end
end



















