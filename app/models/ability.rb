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

    can :manage, [Task, Scorecard, Hypothesis, Assumption, Experiment, Document] do |resource|
      resource.project.members.include?(user)
    end

    can :manage, Membership do |membership|
      membership.project.admins.include?(user)
    end
  end
end
