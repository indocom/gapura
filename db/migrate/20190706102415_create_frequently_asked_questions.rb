class CreateFrequentlyAskedQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :frequently_asked_questions do |t|
      t.string :question, null: false
      t.text :answer, null: false
    end
  end
end
