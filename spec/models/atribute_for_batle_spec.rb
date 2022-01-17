require 'rails_helper'

RSpec.describe AtributeForBatle, type: :model do
  it { should validate_presence_of(:atack) }
  it { should validate_presence_of(:stamina) }
  it { should validate_presence_of(:defense) }
  it { should validate_presence_of(:total_stamina) }
  it { should validate_presence_of(:cp_max) }
end
