class Family < ApplicationRecord
  validates :cross_gen, presence: true
  validates :generation, presence: true
  has_many :pokemons
end
