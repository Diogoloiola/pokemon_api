class CreateAtributeForBattles < ActiveRecord::Migration[6.1]
  def change
    create_table :atribute_for_battles do |t|
      t.integer :atack
      t.integer :stamina
      t.integer :defense
      t.integer :total_stamina
      t.integer :cp_max
      t.integer :hp_max

      t.timestamps
    end
  end
end
