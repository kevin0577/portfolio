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
		
end

