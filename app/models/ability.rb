# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # rubocop:todo Metrics/MethodLength
    can :read, Event
    if user.present?
      if # rubocop:todo Style/GuardClause
         user.has_role?(:admin) ||
           user.has_role?(:superuser)
        # rubocop:todo Layout/ConditionPosition

        # rubocop:enable Layout/ConditionPosition
        can %i[create update destroy], Event
        can %i[create update destroy], FrequentlyAskedQuestion
        can %i[create update destroy], Testimony
        can %i[create update], Ticket
      end
      if user.has_role? :superuser
        can %i[update destroy], User
        can %i[destroy], Ticket
        can %i[email], Subscriber
      end
    end
  end
end
