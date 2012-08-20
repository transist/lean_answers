require 'spec_helper'

describe Ability do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:ability) { Ability.new(user) }

  context 'Project' do
    context 'owner' do
      it 'should be able to manage' do
        project = user.create_project
        expect(ability).to be_can(:manage, project)
      end
    end

    context 'admin' do
      it 'should be able to manage' do
        project.add_admin(user)
        expect(ability).to be_can(:manage, project)
      end
    end

    context 'member' do
      it 'should be able to read' do
        project.add_member(user)
        expect(ability).to be_can(:read, project)
      end

      it 'should not be able to update and destroy' do
        project.add_member(user)
        expect(ability).to be_cannot(:update, project)
        expect(ability).to be_cannot(:destroy, project)
      end
    end

    context 'non-member' do
      it 'should be able to create' do
        expect(ability).to be_can(:create, project)
      end

      it 'should not be able to access' do
        expect(ability).to be_cannot(:read, project)
        expect(ability).to be_cannot(:update, project)
        expect(ability).to be_cannot(:destroy, project)
      end
    end

    context 'guest' do
      let(:ability) { Ability.new(nil) }

      it 'should not be able to create' do
        expect(ability).to be_cannot(:create, project)
      end

      it 'should not be able to access' do
        expect(ability).to be_cannot(:read, project)
        expect(ability).to be_cannot(:update, project)
        expect(ability).to be_cannot(:destroy, project)
      end
    end
  end

  [Task, Scorecard, Hypothesis, Assumption, Experiment, Document].each do |resource|
    context "#{resource.to_s} of Project" do
      context 'member' do
        it 'should be able to manage' do
          project.add_member(user)
          expect(ability).to be_can(:manage, project.send(resource.to_s.tableize).new)
        end
      end

      context 'non-member' do
        it 'should not be able to manage' do
          expect(ability).to be_cannot(:manage, project.send(resource.to_s.tableize).new)
        end
      end

      context 'guest' do
        it 'should not be able to manage' do
          ability = Ability.new(nil)
          expect(ability).to be_cannot(:manage, project.send(resource.to_s.tableize).new)
        end
      end
    end
  end

  context 'Membership of Project' do
    context 'admin' do
      it 'should be able to manage' do
        project.add_admin(user)
        expect(ability).to be_can(:manage, project.memberships.new)
      end
    end

    context 'member' do
      it 'should be able to manage' do
        project.add_member(user)
        expect(ability).to be_cannot(:manage, project.memberships.new)
      end
    end

    context 'non-member' do
      it 'should be able to manage' do
        expect(ability).to be_cannot(:manage, project.memberships.new)
      end
    end

    context 'guest' do
      it 'should not be able to manage' do
        ability = Ability.new(nil)
        expect(ability).to be_cannot(:manage, project.memberships.new)
      end
    end
  end
end
