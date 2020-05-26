require "rails_helper"

RSpec.describe "投稿のテスト", type: :feature do
	let!(:user) { create(:user) }
	let!(:user2) { create(:user) }
	let!(:bike) { create(:bike) }
	let!(:bike2) { create(:bike) }
	let(:image_path) { File.join(Rails.root, 'spec/fixtures/image.jpg') }
	let(:image) { Rack::Test::UploadedFile.new(image_path) }
	before do
		visit new_user_session_path
		fill_in "user[email]", with: user.email
		fill_in "user[password]", with: user.password
		click_button "Log in"
	end
	context "投稿一覧のテスト" do
	before do
		visit bikes_path
	end
		it "自分と他人の画像が表示される" do
	        expect(all("img").size).to eq(4)
		end
		it "自分と他人のtitleが表示される" do
			expect(page).to have_content bike.title
			expect(page).to have_content bike2.title
		end
		it "お気に入りが表示される" do
			expect(page).to have_content "お気に入り追加"
		end
		it "フォローが表示される" do
			expect(page).to have_content "フォローする"
		end
		it "画像のリンク先が正しい" do
			expect(page).to have_link "", href: bike_path(bike)
		end
  	end

  	context "投稿フォームのテスト" do
  		before do
  			visit new_bike_path
  		end
  		it "投稿に成功する" do
  			fill_in "bike[image]", with: image
  			fill_in "bike[title]", with: bike.title
  			click_button "投稿"
  			expect(page).to have_content "successfully"
  		end
  	end
end


