class Pokemon < ApplicationRecord
  belongs_to :type
  belongs_to :family
  belongs_to :atribute_for_batle
end
