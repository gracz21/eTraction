require 'rails_helper'

RSpec.describe Message, type: :model do
  context '#ride' do
    it { should belong_to(:ride) }
  end

  context '#text' do
    it { should validate_presence_of(:text) }
    it { should validate_length_of(:text).is_at_most(140) }
  end

  context '#user' do
    it { should belong_to(:user) }
    it { should validate_presence_of(:user) }
  end
end
