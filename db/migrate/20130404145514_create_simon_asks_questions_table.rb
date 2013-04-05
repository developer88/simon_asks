class CreateSimonAsksQuestionsTable < ActiveRecord::Migration
  def change
    create_table :simon_asks_questions do |t| 
      t.integer :user_id   
      t.string  :title
      t.text    :content
      t.boolean :marked, :default => false
      t.integer :answers_count, :default => 0
      t.integer :comments_count, :default => 0
      t.integer :views_count, :default => 0
      t.string  :image
      t.timestamps
    end
  end
end
