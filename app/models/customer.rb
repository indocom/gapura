class Customer < ApplicationRecord
  has_many :tickets, inverse_of: :customer, dependent: :nullify

  before_validation :downcase_email
  after_create :create_subscriber

  private
    def downcase_email
      self.email = email.downcase
    end

    def create_subscriber
      Subscriber.create(customer: self)
    end

end
