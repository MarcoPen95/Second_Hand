require 'rails_helper'

RSpec.describe Announcement, type: :model do
  describe 'Announcement navigation' do
    describe 'Creation' do
      before do
        @seller = Seller.create(username: "sandokan", email: "test@test.com", password: "password", password_confirmation: "password")
        @announcement = Announcement.create(title: "t1", category: "Books", price: "25", description: "desc", seller_id: @seller.id)
      end
      it 'should be able to be created if valid' do
        expect(@announcement).to be_valid
      end
  
      describe 'Validations' do
        it 'should not be valid without a title' do
          @announcement.title = nil
          expect(@announcement).to_not be_valid
        end
        it 'should not be valid without a category' do
          @announcement.category = nil
          expect(@announcement).to_not be_valid
        end
        it 'should not be valid without a price' do
          @announcement.price = nil
          expect(@announcement).to_not be_valid
        end
        it 'should not be valid without a description' do
          @announcement.description = nil
          expect(@announcement).to_not be_valid
        end
        it 'should not be valid without a seller_id' do
          @announcement.seller_id = nil
          expect(@announcement).to_not be_valid
        end
      end

      describe "Associations" do
        it "belongs to seller" do
          assc = described_class.reflect_on_association(:seller)
          expect(assc.macro).to eq :belongs_to
        end
        it "has one purchase" do
          assc = described_class.reflect_on_association(:purchase)
          expect(assc.macro).to eq :has_one 
        end
      end
    end
  end
end
