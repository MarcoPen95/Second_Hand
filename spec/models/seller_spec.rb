require 'rails_helper'

RSpec.describe Seller, type: :model do
  require 'rails_helper'
  
  describe 'Seller navigation' do
    describe 'Creation' do
      before do
        @seller = Seller.create(username: "cl", email: "test1@test1.com", password: "password1", password_confirmation: "password1")
      end
      it 'should be able to be created if valid' do
        expect(@seller).to be_valid
      end

      describe 'Validations' do
        it 'should not be valid without a username' do
          @seller.username = nil
          expect(@seller).to_not be_valid
        end
        it 'should not be valid without an email' do
          @seller.email = nil
          expect(@seller).to_not be_valid
        end
      end

      describe "Associations" do
        it "has many notifications" do
          assc = described_class.reflect_on_association(:notifications)
          expect(assc.macro).to eq :has_many
        end
        it "has many announcements" do
          assc = described_class.reflect_on_association(:announcements)
          expect(assc.macro).to eq :has_many
        end
        it "has many orders" do
          assc = described_class.reflect_on_association(:orders)
          expect(assc.macro).to eq :has_many
        end
      end
    end  
  end
end

