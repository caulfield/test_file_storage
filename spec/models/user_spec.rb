require 'spec_helper'

describe User do
  it 'should be valid' do
    user = build :user
    expect(user).to be_valid
  end
end
