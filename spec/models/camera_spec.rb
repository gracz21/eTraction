require 'rails_helper'

RSpec.describe Camera, type: :model do
  context '#name' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  context '#url' do
    it { should validate_presence_of(:url) }
    it { should allow_value('http://foo.com').for(:url) }
    it { should_not allow_value('http://foo com').for(:url) }
  end
end
