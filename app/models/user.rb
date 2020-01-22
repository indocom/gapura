# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :omniauthable,
         omniauth_providers: %i[google_oauth2]

  # rubocop:todo Lint/BooleanSymbol
  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  # rubocop:enable Lint/BooleanSymbol
  # Only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true

  attr_writer :login

  def login
    @login || username || email
  end

  # rubocop:todo Metrics/MethodLength
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    # rubocop:todo Lint/AssignmentInCondition
    if login = conditions.delete(:login)
      # rubocop:enable Lint/AssignmentInCondition
      where(conditions.to_h).where(
        [
          'lower(username) = :value OR lower(email) = :value',
          { value: login.downcase }
        ]
      )
        .first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end
  # rubocop:enable Metrics/MethodLength
end
