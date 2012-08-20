require 'spec_helper'

describe Project do
  let(:project) { create(:project) }

  it 'should create instance via factory' do
    expect {
      create(:project)
    }.to change(Project, :count).by(1)
  end

  describe '#owner' do
    it 'should return owner of the project' do
      membership = project.memberships.owner.first
      expect(project.owner) == membership.user
    end
  end
end
