class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest who hasn't signed in

    can :manage, Project do |project|
      project.owner == user or project.admins.include?(user)
    end
    can :read, Project do |project|
      project.members.include?(user)
    end
    can :create, Project if user.persisted?
    can :manage, Task, project: {memberships: {user_id: user.id}}
    can :manage, Scorecard, project: {memberships: {user_id: user.id}}
    can :manage, Hypothesis, project: {memberships: {user_id: user.id}}
    can :manage, Assumption, project: {memberships: {user_id: user.id}}
    can :manage, Experiment, project: {memberships: {user_id: user.id}}
    can :manage, Document, project: {memberships: {user_id: user.id}}
    can :manage, Membership, user_id: user.id
  end
end
