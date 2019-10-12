class Customer < ApplicationRecord
  has_many :tickets, inverse_of: :customer, dependent: :nullify

  before_validation :downcase_email

  private
    def downcase_email
      self.email = email.downcase
    end
end
