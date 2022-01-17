class AtributeForBatle < ApplicationRecord
  validates_presence_of :atack, :stamina, :total_stamina, :defense, :cp_max, :hp_max, presence: true
end
