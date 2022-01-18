require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:evolved) }
  it { should validate_presence_of(:url_image) }
  it { should validate_presence_of(:evolution_stage) }
  it { should validate_presence_of(:legendary) }
  it { should validate_presence_of(:aquireable) }
  it { should validate_presence_of(:spawns) }
  it { should validate_presence_of(:regional) }
  it { should validate_presence_of(:raidable) }
  it { should validate_presence_of(:hatchable) }
  it { should validate_presence_of(:shiny) }
  it { should validate_presence_of(:nest) }
  it { should validate_presence_of(:is_new) }
  it { should validate_presence_of(:not_gettable) }
  it { should validate_presence_of(:future_evolve) }

  
end
