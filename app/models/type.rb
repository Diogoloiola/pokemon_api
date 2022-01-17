class Type < ApplicationRecord
  validates :one, presence: true
  validates :two, presence: true
end
