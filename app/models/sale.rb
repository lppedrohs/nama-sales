class Sale < ApplicationRecord
  belongs_to :provider
  belongs_to :buyer

  validates_presence_of :price, :quantity, :address, :provider, :buyer
end
