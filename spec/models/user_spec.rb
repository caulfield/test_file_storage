require 'spec_helper'

describe User do
  it { expect(subject).to have_many(:assets) }

  it 'should be valid' do
    user = build :user
    expect(user).to be_valid
  end
end
