require 'spec_helper'

describe Ability do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:ability) { Ability.new(user) }
  subject { ability }

  context 'project' do
    it 'should be created by any user' do
      expect be_can(:create, Project)
    end

    it 'should be managed by admin' do
      project = user.projects.create
      expect be_can(:manage, project)
    end

    it 'should be read by member' do
      project.users << user
      expect(ability).to be_can(:read, project)
    end

    it 'should not be managed by member' do
      project.users << user
      expect(ability).not_to be_can(:update, project)
      expect(ability).not_to be_can(:destroy, project)
    end

    it 'should not be accessible by non-member' do
      expect(ability).not_to be_can(:read, project)
      expect(ability).not_to be_can(:update, project)
      expect(ability).not_to be_can(:destroy, project)
    end

    it 'should be created by any user' do
      expect be_can(:create, project)
    end

    it 'should not be accessible by guest' do
      ability = Ability.new(nil)
      expect(ability).not_to be_can(:read, project)
      expect(ability).not_to be_can(:create, project)
      expect(ability).not_to be_can(:update, project)
      expect(ability).not_to be_can(:destroy, project)
    end
  end
end
