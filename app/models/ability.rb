# frozen_string_literal: true

# This is a top-level documentation
class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.has_role? :admin
      can %i[create update destroy], User if user.has_role? :superuser
    end
  end
end
