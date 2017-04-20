require 'rails_helper'

RSpec.describe Track, type: :model do
  context '#name' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  context '#track_items' do
    it { should have_many(:track_items) }
    it { should validate_presence_of(:track_items) }
  end

  context '#stops' do
    it { should have_many(:stops).through(:track_items) }
    it { should validate_presence_of(:stops) }
  end
end
