class CreateAtributeForBatles < ActiveRecord::Migration[6.1]
  def change
    create_table :atribute_for_batles do |t|
      t.string :atack
      t.string :stamina
      t.string :defense
      t.string :total_stamina
      t.string :cp_max
      t.string :hp_max

      t.timestamps
    end
  end
end
