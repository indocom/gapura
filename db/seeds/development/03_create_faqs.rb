for i in FrequentlyAskedQuestion.count..4 do
  FrequentlyAskedQuestion.create(question: "Question #{i} " * 5 + "?", answer: "Answer #{i} " * 20 + "." )
end
