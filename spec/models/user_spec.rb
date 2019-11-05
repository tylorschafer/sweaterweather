require 'rails_helper'

describe User do
  describe 'Instance methods' do
    it '#generate token will generate a secure JWT' do
      user = create(:user)
      token = user.generate_token
      expect(token).to be_a String
      expect(token.length).to be > 10
    end
  end
end
