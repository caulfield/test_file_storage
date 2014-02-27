require 'spec_helper'

describe AssetDecorator do
  let(:instance) { build_stubbed :asset }

  let(:decorated) { AssetDecorator.new instance }

  describe '#user' do
    it 'returns user email' do
      instance.stub user: build_stubbed(:user, email: 'test@test.test')
      expect(decorated.user).to eq 'test@test.test'
    end
  end
end
