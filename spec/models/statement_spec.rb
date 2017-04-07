require 'rails_helper'

RSpec.describe Statement, type: :model do
  subject { Statement.new }

  it 'is valid with valid attributes' do
    subject.title = Faker::Name.title
    subject.text = 'Some statement text'
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.text = 'Some statement text'
    expect(subject).to_not be_valid
  end

  it 'is not valid without a text' do
    subject.title = Faker::Name.title
    expect(subject).to_not be_valid
  end
end
