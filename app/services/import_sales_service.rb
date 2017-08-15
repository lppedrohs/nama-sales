require 'csv'

class ImportSalesService

  HEADERS      = true
  SEPARATOR    = "\t"
  KEYS_HANDLER = {
    buyer:       'comprador',
    description: 'descrição',
    provider:    'fornecedor',
    price:       'preço unitário',
    quantity:    'quantidade',
    address:     'endereço'
  }

  def initialize(importation, **options)
    @importation = importation
    @headers     = options[:headers] || HEADERS
    @separator   = options[:separator] || SEPARATOR
  end

  def call
    return false if @importation.invalid?

    sales = []
    rows  = CSV.parse(get_file_data, headers: @headers, col_sep: @separator)

    rows.each { |attributes| sales << parse_sale(attributes) }

    Sale.create(sales)
  end

  private

    def get_file_data
      @importation.file.read.force_encoding("UTF-8")
    end

    def parse_sale(attrs)
      attrs = attrs.to_hash.transform_keys { |key| key.to_s.downcase }

      {
        description: attrs[KEYS_HANDLER[:description]].try(:to_s),
        price:       attrs[KEYS_HANDLER[:price]].try(:to_f),
        quantity:    attrs[KEYS_HANDLER[:quantity]].try(:to_i),
        address:     attrs[KEYS_HANDLER[:address]].try(:to_s),
        buyer: Buyer.find_or_initialize_by(name: attrs[KEYS_HANDLER[:buyer]]),
        provider: Provider.find_or_initialize_by(name: attrs[KEYS_HANDLER[:provider]]),
        importation_id: @importation.id
      }
    end

end
