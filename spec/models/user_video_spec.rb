require 'rails_helper'

RSpec.describe UserVideo, type: :model do
  context '#ride' do
    it { should belong_to(:user) }
    it { should validate_presence_of(:user) }
  end

  context '#title' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(50) }
  end

  context '#user' do
    it { should belong_to(:user) }
    it { should validate_presence_of(:user) }
  end

  context '#video' do
    it { should validate_presence_of(:video) }
  end
end
