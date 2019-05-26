# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
    if user.has_role? :admin
      if user.has_role? :superuser
        can [:create, :update, :destroy], User
      end
    end
  end
end
