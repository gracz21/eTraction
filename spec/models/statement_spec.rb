require 'rails_helper'

RSpec.describe Statement, type: :model do
  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
  end
end
