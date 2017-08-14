class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.references :provider, foreign_key: true
      t.references :buyer, foreign_key: true
      t.text       :description
      t.decimal    :price, precision: 10, scale: 2
      t.integer    :quantity, default: 1
      t.string     :address

      t.timestamps
    end
  end
end
