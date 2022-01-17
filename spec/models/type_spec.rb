require 'rails_helper'

RSpec.describe Type, type: :model do
  it { should validate_presence_of(:one) }
  it { should validate_presence_of(:two) }
end
