require "rails_helper"

RSpec.describe "ユーザーテスト", type: :feature do

	before do
		visit new_user_registration_path
	end

	context "新規登録する" do
		it "新規登録に成功する" do
			fill_in "user[name]", with: "ccc"
			fill_in "user[bike_name]", with: "cd650r"
			fill_in "user[email]", with: "c@c.c"
			fill_in "user[password]", with: "cccccc"
			fill_in "user[password_confirmation]", with: "cccccc"
			click_button "Sign up"

	        expect(page).to have_content 'マイページ'
		end
	end

end