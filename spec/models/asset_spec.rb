require 'spec_helper'

describe Asset do
  it { expect(subject).to validate_presence_of(:name) }
  it { expect(subject).to validate_presence_of(:file) }

  it 'valid' do
    asset = build :asset
    expect(asset).to be_valid
  end
end
