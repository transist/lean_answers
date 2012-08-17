require 'spec_helper'

describe Project do
  let(:project) { create(:project) }

  it 'should create instance via factory' do
    expect {
      create(:project)
    }.to change(Project, :count).by(1)
  end
end
