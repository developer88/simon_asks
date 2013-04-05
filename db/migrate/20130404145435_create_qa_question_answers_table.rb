class CreateQaQuestionAnswersTable < ActiveRecord::Migration
  def change
    create_table :qa_question_answers do |t| 
      t.integer :user_id 
      t.text    :content
      t.integer :question_id
      t.integer :comments_count
      t.integer :cached_votes_score, :default => 0
      t.timestamps
    end
  end
end
