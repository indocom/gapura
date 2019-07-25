# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Event
    if user.present?
      if user.has_role? :admin or user.has_role? :superuser
        can [:create, :update, :destroy], Event
        can [:create, :update, :destroy], FrequentlyAskedQuestion
        can [:create, :update, :destroy], Testimony
      end
      if user.has_role? :superuser
        can [:update, :destroy], User
      end
    end
  end
end
