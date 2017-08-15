require 'rails_helper'

RSpec.describe Buyer, type: :model do

  describe 'validations' do

    context 'when not valid' do
      let(:buyer) { build(:buyer, name: nil) }

      it 'name is required' do
        expect(buyer).to be_invalid
        expect(buyer.errors).to include :name
      end
    end

    context 'when is valid' do
      let(:buyer) { build(:buyer) }

      it do
        expect(buyer).to be_valid
        expect(buyer.errors).to be_blank
      end
    end
  end

end
