class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #

    can :manage, Project, memberships: {user_id: user.id}
    can :manage, Task, project: {memberships: {user_id: user.id}}
    can :manage, Scorecard, project: {memberships: {user_id: user.id}}
    can :manage, Hypothesis, project: {memberships: {user_id: user.id}}
    can :manage, Assumption, project: {memberships: {user_id: user.id}}
    can :manage, Experiment, project: {memberships: {user_id: user.id}}
    can :manage, Document, project: {memberships: {user_id: user.id}}
    can :manage, Membership, user_id: user.id

    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
