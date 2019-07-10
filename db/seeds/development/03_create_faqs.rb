10.times do |i|
  FrequentlyAskedQuestion.create(question: "Question #{i} " * 5 + "?", answer: "Answer #{i} " * 20 + "." )
end
