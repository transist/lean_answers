require 'spec_helper'

describe Membership do
  it 'should create instance via factory' do
    expect {
      create(:membership)
    }.to change(Membership, :count).by(1)
  end
end
