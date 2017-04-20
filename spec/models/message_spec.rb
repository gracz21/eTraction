require 'rails_helper'

RSpec.describe Message, type: :model do
  context '#text' do
    it { should validate_presence_of(:text) }
    it { should validate_length_of(:text).is_at_most(140) }
  end
end
