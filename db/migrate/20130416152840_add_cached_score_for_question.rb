class AddCachedScoreForQuestion < ActiveRecord::Migration
  def change
    add_column :simon_asks_questions, :cached_votes_score, :integer, default: 0
    add_index :simon_asks_questions, :cached_votes_score
  end
end
