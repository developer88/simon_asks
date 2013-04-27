# This migration comes from simon_asks (originally 20130416153025)
class AddCachedScoreIndexForQuestionAnswers < ActiveRecord::Migration
  def change
    add_index :simon_asks_question_answers, :cached_votes_score
  end
end
