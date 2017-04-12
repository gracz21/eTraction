require 'rails_helper'

RSpec.describe Track, type: :model do
  context '#name' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end
end
