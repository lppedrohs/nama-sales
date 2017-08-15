class Sale < ApplicationRecord
  belongs_to :provider
  belongs_to :buyer
  belongs_to :importation

  validates_presence_of :price, :quantity, :address, :provider, :buyer
end
