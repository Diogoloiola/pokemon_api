class Pokemon < ApplicationRecord
  belongs_to :family
  belongs_to :atribute_for_battle

  validates :name, presence: true
  validates :evolved, presence: true
  validates :url_image, presence: true
  validates :evolution_stage, presence: true
  validates :legendary, presence: true
  validates :aquireable, presence: true
  validates :spawns, presence: true
  validates :raidable, presence: true
  validates :hatchable, presence: true
  validates :shiny, presence: true
  validates :nest, presence: true
  validates :is_new, presence: true
  validates :not_gettable, presence: true
  validates :future_evolve, presence: true
  validates :regional, presence: true
end
