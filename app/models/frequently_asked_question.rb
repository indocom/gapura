class FrequentlyAskedQuestion < ApplicationRecord
  validates :question, :answer, presence: true
end
