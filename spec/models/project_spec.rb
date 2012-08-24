require 'spec_helper'

describe Project do
  let(:project) { create(:project) }
  let(:user) { create(:user) }

  it 'should create instance via factory' do
    expect {
      create(:project)
    }.to change(Project, :count).by(1)
  end

  describe '#owner' do
    it 'should return owner of the project' do
      membership = project.memberships.owner.first
      expect(project.owner).to eq(membership.user)
    end
  end

  describe '#add_admin' do
    it 'should set user as admin of the project' do
      project.add_admin(user)
      expect(project.admins).to include(user)
    end

    it 'should set user as member of the project' do
      project.add_admin(user)
      expect(project.members).to include(user)
    end

    it 'should not set user as owner of the project' do
      project.add_admin(user)
      expect(project.owner).not_to eq(user)
    end
  end

  describe '#add_member' do
    it 'should set user as member of the project' do
      project.add_member(user)
      expect(project.members).to include(user)
    end

    it 'should not set user as admin of the project' do
      project.add_member(user)
      expect(project.admins).not_to include(user)
    end

    it 'should not set user as owner of the project' do
      project.add_member(user)
      expect(project.owner).not_to eq(user)
    end
  end
end
