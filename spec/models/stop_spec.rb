require 'rails_helper'

RSpec.describe Stop, type: :model do
  context '#name' do
    it { should validate_presence_of(:name) }
  end
end
