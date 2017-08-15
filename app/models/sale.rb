class Sale < ApplicationRecord
  belongs_to :provider
  belongs_to :buyer
  belongs_to :importation, required: false

  validates_presence_of :price, :quantity, :address, :provider, :buyer
end
