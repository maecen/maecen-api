require 'rails_helper'

describe User do
  before :each do
    @user = create :user
  end

  describe '.creative?' do
    context 'default' do
      it 'returns false' do
        expect(@user.creative?).to be false
      end
    end
    context 'creative' do
      it 'returns true' do
        @user.update_attributes account_type: 'creative'
        expect(@user.creative?).to be true
      end
    end
  end
end