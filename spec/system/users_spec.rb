require "rails_helper"

RSpec.describe "新規登録のテスト", type: :feature do
	let!(:user) { create(:user) }
	before do
			visit new_user_registration_path
	end
	context "新規登録画面に遷移" do
		it "新規登録に成功する" do
			fill_in "user[name]", with: "テストユーザー"
			fill_in "user[bike_name]", with: "text"
			fill_in "user[email]", with: "test@text.text"
			fill_in "user[password]", with: "password"
			fill_in "user[password_confirmation]", with: "password"
			click_button "Sign up"
			expect(page).to have_content "マイページ"
		end

		it "新規登録に失敗する" do
			fill_in "user[name]", with: ""
			fill_in "user[bike_name]", with: ""
			fill_in "user[email]", with: ""
			fill_in "user[password]", with: ""
			fill_in "user[password_confirmation]", with: ""
			click_button "Sign up"
			expect(page).to have_content "errors"
		end
	end
end

RSpec.describe "ログインのテスト", type: :feature do
	let!(:user) { create(:user) }
	before do
		visit new_user_session_path
	end
	context "ログイン画面に遷移" do
		it "ログインに成功する" do
			fill_in "user[email]", with: user.email
			fill_in "user[password]", with: user.password
			click_button "Log in"
			expect(page).to have_content "マイページ"
		end
		it "ログインに失敗する" do
			fill_in "user[email]", with: ""
			fill_in "user[password]", with: ""
			click_button "Log in"
			expect(current_path).to eq (new_user_session_path)
		end
	end
end

RSpec.describe "ユーザーのテスト", type: :feature do
	let!(:user) { create(:user) }
	let!(:user2) { create(:user) }
	before do
		visit new_user_session_path
		fill_in "user[email]", with: user.email
		fill_in "user[password]", with: user.password
		click_button "Log in"
	end

	context "マイページの確認" do
	    it "名前が表示される" do
	        expect(page).to have_content (user.name)
	    end
	    it "車種が表示される" do
	        expect(page).to have_content (user.bike_name)
	    end
	    it "お気に入り一覧に遷移する" do
	    	click_link "お気に入り"
	    	expect(current_path).to eq (bookmarks_index_path)
	    end
	    it "プロフィール編集に遷移する" do
	    	click_link "プロフィール編集"
	    	expect(current_path).to eq (edit_user_path(user))
	    end
	    it "フォロー一覧に遷移する" do
	    	click_link "フォロー数"
	    	expect(current_path).to eq (user_follows_path(user))
	    end
	    it "フォロワー一覧に遷移する" do
	    	click_link "フォロワー数"
	    	expect(current_path).to eq (user_follower_path(user))
	    end
	end

	context "編集のテスト" do
		it "自分の編集画面に遷移する" do
			visit edit_user_path(user)
			expect(current_path).to eq ("/users/" + user.id.to_s + "/edit")
		end
		it "他人の編集画面に遷移できない" do
			visit edit_user_path(user2)
			expect(current_path).to eq ("/users/" + "2")
		end
		it "編集に成功する" do
			visit edit_user_path(user)
			click_button "変更を保存"
			expect(page).to have_content "マイページ"
		end
		it "編集に失敗する" do
			visit edit_user_path(user)
			fill_in "user[bike_name]", with: ""
			click_button "変更を保存"
			expect(page).to have_content "error"
		end
	end

	context "一覧画面のテスト" do
		before do
			visit users_path
		end
		it "自分と他人の画像が表示されている" do
	        expect(all('img').size).to eq(2)
	    end
	    it "自分と他人の名前が表示されている" do
	    	expect(page).to have_content user.name
	    	expect(page).to have_content user2.name
	    end
	    it "フォローボタンが表示されている" do
	    	expect(page).to have_content "フォローする"
	    end
	end
end
























