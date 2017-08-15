require 'rails_helper'

RSpec.describe Provider, type: :model do

  describe 'validations' do

    context 'when not valid' do
      let(:provider) { build(:provider, name: nil) }

      it 'name is required' do
        expect(provider).to be_invalid
        expect(provider.errors).to include :name
      end
    end

    context 'when is valid' do
      let(:provider) { build(:provider) }

      it do
        expect(provider).to be_valid
        expect(provider.errors).to be_blank
      end
    end

  end

end
