# frozen_string_literal: true

Mailgun.configure { |config| config.api_key = ENV['MAILGUN_API_KEY'] }
