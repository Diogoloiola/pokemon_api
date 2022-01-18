class CreateFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :families do |t|
      t.integer :generation
      t.boolean :cross_gen

      t.timestamps
    end
  end
end
