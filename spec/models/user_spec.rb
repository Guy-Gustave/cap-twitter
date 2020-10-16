require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations text' do
    it 'should save successfully' do
      user = User.new(username: 'User1', fullname: 'user1 second name').save
      expect(user) == true
    end

    it 'ensures username of user is present' do
      user = User.new(fullname: 'user1 second name').save
      expect(user).to eq(false)
    end

    it 'ensures fullname of user is present' do
      user = User.new(username: 'User1').save
      expect(user).to eq(false)
    end
  end

end

