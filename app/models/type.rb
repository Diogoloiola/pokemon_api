class Type < ApplicationRecord
  validates :one, presence: true
  validates :two, presence: true

  has_many :pokemons
end
