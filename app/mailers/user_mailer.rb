class UserMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'users/mailer'

  def confirmation_instructions(record, token, opts={})
    @username = record.username
    super
  end

  def reset_password_instructions(record, token, opts={})
    fail
    super
  end

  def unlock_instructions(record, token, opts={})
    fail
    super
  end

  def email_changed(record, opts={})
    fail
    super
  end

  def password_change(record, opts={})
    fail
    super
  end
end
