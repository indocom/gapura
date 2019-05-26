# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, PastEvent
    if user.present?
      if user.has_role? :admin || user.has_role? :superuser
        can [:create, :update, :destroy], PastEvent
      end
      if user.has_role? :superuser
        can [:create, :update, :destroy], User
      end
    end
  end
end
