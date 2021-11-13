class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post
    can :create, Comment
    can :manage, Post, author_id: user.id
    can :manage, Comment, author_id: user.id
    return unless user.admin?
  end

  # See the wiki for details:
  # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
end
