require 'rails_helper'

RSpec.describe Buyer, type: :model do
  
  describe 'Buyer navigation' do
    describe 'Creation' do
      before do
        @buyer = Buyer.create(username: "pg", email: "test@test.com", password: "password", password_confirmation: "password")
      end
      it 'should be able to be created if valid' do
        expect(@buyer).to be_valid
      end

      describe 'Validations' do
        it 'should not be valid without a username' do
          @buyer.username = nil
          expect(@buyer).to_not be_valid
        end
        it 'should not be valid without an email' do
          @buyer.email = nil
          expect(@buyer).to_not be_valid
        end
      end

      describe "Associations" do
        it "has many favorites" do
          assc = described_class.reflect_on_association(:favorites)
          expect(assc.macro).to eq :has_many
        end
        it "has many purchases" do
          assc = described_class.reflect_on_association(:purchases)
          expect(assc.macro).to eq :has_many
        end
      end
    end  
  end  
end
