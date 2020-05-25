# frozen_string_literal: true

class UserMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'users/mailer'

  def confirmation_instructions(record, token, opts = {})
    @username = record.username
    super
  end

  def reset_password_instructions(record, token, opts = {})
    raise
    super # rubocop:todo Lint/UnreachableCode
  end

  def unlock_instructions(record, token, opts = {})
    raise
    super # rubocop:todo Lint/UnreachableCode
  end

  def email_changed(record, opts = {})
    raise
    super # rubocop:todo Lint/UnreachableCode
  end

  def password_change(record, opts = {})
    raise
    super # rubocop:todo Lint/UnreachableCode
  end
end
