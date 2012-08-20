require 'spec_helper'

describe User do
  let(:user) { create(:user) }

  describe '#create_project' do
    it 'should create a project' do
      expect {
        user.create_project
      }.to change(user.projects, :count).by(1)
    end

    it 'accept attributes of the project' do
      project = user.create_project(name: 'LeanAnswers')
      expect(project.name) == 'LeanAnswers'
    end

    it 'should set user as owner of the project' do
      project = user.create_project
      expect(project.owner) == user
    end

    it 'should set user as admin of the project' do
      project = user.create_project
      expect(project.admins).to include(user)
    end

    it 'should set user as member of the project' do
      project = user.create_project
      expect(project.members).to include(user)
    end
  end
end
