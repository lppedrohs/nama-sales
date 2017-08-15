class AddImportationToSales < ActiveRecord::Migration[5.1]
  def change
    add_reference :sales, :importation, foreign_key: true
  end
end
