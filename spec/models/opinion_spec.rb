require 'rails_helper'

RSpec.describe Opinion, type: :model do
  describe 'validations text' do
    it { should validate_presence_of(:text) }
    it 'is invalid when text is blank' do
      subject.text = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:auther) }
    it { should have_many(:likes) }
  end
end
