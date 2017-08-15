require 'rails_helper'

RSpec.describe Sale, type: :model do

  describe 'validations' do

    context 'when not valid' do
      let(:sale) { build(:sale) }

      it 'price is required' do
        sale.price = nil

        sale.save

        expect(sale.errors).to include :price
      end

      it 'quantity is required' do
        sale.quantity = nil

        sale.save

        expect(sale.errors).to include :quantity
      end

      it 'address is required' do
        sale.address = nil

        sale.save

        expect(sale.errors).to include :address
      end

      it 'provider is required' do
        sale.provider = nil

        sale.save

        expect(sale.errors).to include :provider
      end

      it 'buyer is required' do
        sale.buyer = nil

        sale.save

        expect(sale.errors).to include :buyer
      end
    end

    context 'when is valid' do
      let(:sale) { build(:sale) }

      it do
        expect(sale).to be_valid
        expect(sale.errors).to be_blank
      end
    end
  end

end
