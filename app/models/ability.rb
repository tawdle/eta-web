class Ability
  include CanCan::Ability

  def initialize(user)
    can :create, Meeting, user: user
    can [:read, :update, :destroy], Meeting do |meeting|
      meeting.user == user
    end
  end
end
