class CreateFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :families do |t|
      t.string :generation
      t.string :cross_gen

      t.timestamps
    end
  end
end
