require 'rails_helper'

RSpec.describe TrackItem, type: :model do
  context '#travel_time' do
    it { should validate_presence_of(:travel_time) }
  end

  context '#stop' do
    it { should belong_to(:stop) }
    it { should validate_presence_of(:stop) }
  end

  context '#track' do
    it { should belong_to(:track) }
  end
end
