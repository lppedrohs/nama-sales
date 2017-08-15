require 'rails_helper'
require 'csv'

RSpec.describe ImportSalesService, type: :service do

  describe 'Create sales' do

    context 'when is valid' do
      let(:importation) { build(:importation) }

      it do
        file_data = importation.file.read.force_encoding("UTF-8")
        sales = CSV.parse(file_data, headers: true, col_sep: "\t")

        ImportSalesService.new(importation).call

        expect(Sale.count).to equal(sales.length)
      end
    end

    context 'when is invalid' do
      let(:importation) { build(:importation, file: nil) }

      it 'file is required' do
        sales = ImportSalesService.new(importation).call

        expect(sales).to be_blank
      end

    end

  end

end
