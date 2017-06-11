require 'rails_helper'

RSpec.describe Location, type: :model do
  # Association test
  it  { should belong_to(:user) }
  # Validation tests
  it { should validate_presence_of(:lat) }
  it { should validate_presence_of(:lon) }
end
