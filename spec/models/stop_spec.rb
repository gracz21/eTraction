require 'rails_helper'

RSpec.describe Stop, type: :model do
  context '#name' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  context '#track_items' do
    it { should have_many(:track_items) }
  end

  context '#tracks' do
    it { should have_many(:tracks).through(:track_items) }
  end
end
