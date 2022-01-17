class Family < ApplicationRecord
  validates :cross_gen, presence: true
  validates :generation, presence: true
end
