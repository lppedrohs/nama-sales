class Importation < ApplicationRecord
  mount_uploader :file, FileUploader

  validates_presence_of :file

  has_many :sales, dependent: :nullify

  def total_mount
    self.sales.inject(0.0) { |sum, sale| sum + sale.price*sale.quantity }
  end
end
