require 'rails_helper'

describe User do
  describe '.creative?' do
    before :each do
      @user = create :user
    end

    context 'default' do
      it 'returns normal' do
        expect(@user.creative?).to be false
      end
    end
    context 'creative' do
      it 'returns creative' do
        @user.update_attributes account_type: 'creative'
        expect(@user.creative?).to be true
      end
    end
  end
end