# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.has_role? :admin
        can [:create, :update, :destroy], PastEvent
        if user.has_role? :superuser
          can [:create, :update, :destroy], User
        end
      end
    end
  end
end
