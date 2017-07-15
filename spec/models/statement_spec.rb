require 'rails_helper'

RSpec.describe Statement, type: :model do
  context '#ride' do
    it { should belong_to(:ride) }
  end

  context '#title' do
    it { should validate_presence_of(:title) }
  end

  context '#text' do
    it { should validate_presence_of(:text) }
  end
end
