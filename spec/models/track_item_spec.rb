require 'rails_helper'

RSpec.describe TrackItem, type: :model do
  context '#sequence_number' do
    it { should validate_presence_of(:sequence_number) }
    it { should validate_uniqueness_of(:sequence_number).scoped_to(:track_id) }
  end

  context '#travel_time' do
    it { should validate_presence_of(:travel_time) }
  end

  context '#stop' do
    it { should belong_to(:stop) }
    it { should validate_presence_of(:stop) }
  end

  context '#track' do
    it { should belong_to(:track) }
    it { should validate_presence_of(:track) }
  end
end
