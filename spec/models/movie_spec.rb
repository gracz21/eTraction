require 'rails_helper'

RSpec.describe Movie, type: :model do
  context '#title' do
    it { should validate_presence_of(:title) }
  end

  context '#genre' do
    it { should validate_presence_of(:genre) }
  end

  context '#length' do
    it { should validate_presence_of(:length) }
  end

  context '#poster' do
    it { should validate_presence_of(:poster) }
  end

  context '#filename' do
    it { should validate_presence_of(:filename) }
  end
end
