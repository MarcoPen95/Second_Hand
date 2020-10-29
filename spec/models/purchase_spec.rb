require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'Purchase navigation' do
    describe 'Creation' do
      before do
        @seller = Seller.create(username: "sandokan", email: "test@test.com", password: "password", password_confirmation: "password")
        @announcement = Announcement.create(title: "t1", category: "Books", price: "25", description: "desc", seller_id: @seller.id)
        @buyer = Buyer.create(username: "cs", email: "test@test.com", password: "password", password_confirmation: "password")
        @purchase = Purchase.create(announcement_id: @announcement.id, buyer_id: @buyer.id)
      end
      it 'should be able to be created if valid' do
        expect(@purchase).to be_valid
      end
  
      describe 'Validations' do
        it 'should not be valid without an announcement_id' do
          @purchase.announcement_id = nil
          expect(@purchase).to_not be_valid
        end
        it 'should not be valid without a buyer_id' do
          @purchase.buyer_id = nil
          expect(@purchase).to_not be_valid
        end
      end

      describe "Associations" do
        it "belongs to announcement" do
          assc = described_class.reflect_on_association(:announcement)
          expect(assc.macro).to eq :belongs_to
        end
        it "belongs to buyer" do
          assc = described_class.reflect_on_association(:buyer)
          expect(assc.macro).to eq :belongs_to
        end
      end
    end
  end
end
