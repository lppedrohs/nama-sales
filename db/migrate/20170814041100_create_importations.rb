class CreateImportations < ActiveRecord::Migration[5.1]
  def change
    create_table :importations do |t|
      t.string :file

      t.timestamps
    end
  end
end
