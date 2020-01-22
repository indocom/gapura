# frozen_string_literal: true

(FrequentlyAskedQuestion.count..4).each do |i|
  FrequentlyAskedQuestion.create(
    question: "Question #{i} " * 5 + '?', answer: "Answer #{i} " * 20 + '.'
  )
end
