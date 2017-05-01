require 'rails_helper'

RSpec.describe Ride, type: :model do
  context '#track' do
    it { should belong_to(:track) }
    it { should validate_presence_of(:track) }
  end
end
