require 'spec_helper'

describe User do
  let(:user) { create(:user) }

  describe '#create_project' do
    it 'should create a project' do
      expect {
        user.create_project
      }.to change(user.projects, :count).by(1)
    end

    it 'should set user as the owner of the project' do
      project = user.create_project
      expect(project.owner) == user
    end

    it 'should set user as the member of the project' do
      project = user.create_project
      expect(project.members).to include(user)
    end
  end
end
