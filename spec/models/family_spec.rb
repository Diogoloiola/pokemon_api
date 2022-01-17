require 'rails_helper'

RSpec.describe Family, type: :model do
  it { should validate_presence_of(:generation) }
  it { should validate_presence_of(:cross_gen) }
end
