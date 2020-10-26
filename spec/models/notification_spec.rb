require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'Announcement navigation' do
    describe 'Creation' do
      before do
        @seller = Seller.create(username: "sandokan", email: "test@test.com", password: "password", password_confirmation: "password")
        @buyer = Buyer.create(username: "cs", email: "test@test.com", password: "password", password_confirmation: "password")
        @announcement = Announcement.create(title: "t1", category: "Books", price: "25", description: "desc", seller_id: @seller.id)
        @notification = Notification.create(recipient_id: @seller.id, actor_id: @buyer.id, action: "buy", notifiable_id: @announcement.id)
      end
      it 'should be able to be created if valid' do
        expect(@notification).to be_valid
      end
  
      describe 'Validations' do
        it 'should not be valid without a seller_id' do
          @notification.recipient_id = nil
          expect(@notification).to_not be_valid
        end
        it 'should not be valid without a buyer' do
          @notification.actor_id = nil
          expect(@notification).to_not be_valid
        end
        it 'should not be valid without notifiable' do
          @notification.notifiable_id = nil
          expect(@notification).to_not be_valid
        end
      end

      describe "Associations" do
        it "belongs to recipient" do
          assc = described_class.reflect_on_association(:recipient)
          expect(assc.macro).to eq :belongs_to
        end
        it "belongs to actor" do
          assc = described_class.reflect_on_association(:actor)
          expect(assc.macro).to eq :belongs_to
        end
        it "belongs to notifiable" do
          assc = described_class.reflect_on_association(:notifiable)
          expect(assc.macro).to eq :belongs_to
        end
      end
    end
  end
end
