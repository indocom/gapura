# frozen_string_literal: true

class FrequentlyAskedQuestion < ApplicationRecord
  validates :question, :answer, presence: true
end
