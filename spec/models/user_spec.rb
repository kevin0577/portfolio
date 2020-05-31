require "rails_helper"

RSpec.describe "userモデルのテスト", type: :feature do
    let(:user) { build(:user) }
    subject { test_user.valid? }
    context "バリデーションのテスト" do
      let(:test_user) { user }
		it "nameカラムが空欄でない" do
			test_user.name = ""
			is_expected.to eq false;
		end
		it "2文字以上である" do
			test_user.name = Faker::Lorem.characters(number:1)
			is_expected.to eq false;
		end
		it "20文字以下である" do
			test_user.name = Faker::Lorem.characters(number:21)
			is_expected.to eq false;
		end
		it "bike_nameカラムが空欄でない" do
			test_user.bike_name = ""
			is_expected.to eq false;
		end
		it "2文字以上である" do
			test_user.bike_name = Faker::Lorem.characters(number:1)
			is_expected.to eq false;
		end
		it "20文字以下である" do
			test_user.bike_name = Faker::Lorem.characters(number:21)
			is_expected.to eq false;
		end
	end

	context "アソシエーションのテスト" do
		it "bikeモデルと1:Nになっている" do
	        expect(User.reflect_on_association(:bikes).macro).to eq :has_many
	    end
	    it "bookmarkモデルと1:Nになっている" do
	        expect(User.reflect_on_association(:bookmarks).macro).to eq :has_many
	    end
	    it "commentモデルと1:Nになっている" do
	        expect(User.reflect_on_association(:comments).macro).to eq :has_many
	    end
	    it "likeモデルと1:Nになっている" do
	        expect(User.reflect_on_association(:likes).macro).to eq :has_many
	    end
	    it "relationshipモデルと1:Nになっている" do
	        expect(User.reflect_on_association(:following_user).macro).to eq :has_many
	        expect(User.reflect_on_association(:follower_user).macro).to eq :has_many
	    end
	end
end


















