require 'rails_helper'

RSpec.describe Opinion, type: :model do
  context 'should belong to user model' do
    it { should belong_to(:author) }
  end
end
