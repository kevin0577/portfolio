require "rails_helper"

RSpec.describe "bikeモデルのテスト", type: :feature do
    let(:user) { create(:user) }
    let!(:bike) { build(:bike, user_id: user.id) }
    context "バリデーションのテスト" do
    	it "titleカラムの空欄でない" do
    		bike.title = ""
	        expect(bike.valid?).to eq false;
	    end
	    it "300文字以下であること" do
        	bike.title = Faker::Lorem.characters(number:301)
        	expect(bike.valid?).to eq false;
        end
	end

	context "アソシエーションのテスト" do
		it "userモデルとN：1になっている" do
			expect(Bike.reflect_on_association(:user).macro).to eq :belongs_to
		end
	end
end


