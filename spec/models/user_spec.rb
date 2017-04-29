require 'rails_helper'

RSpec.describe User, type: :model do
  context '#device_id' do
    it { should validate_presence_of(:device_id) }
    it { should validate_uniqueness_of(:device_id) }
  end

  context '#username' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end

  context '#messages' do
    it { should have_many(:messages) }
  end
end
