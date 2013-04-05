class CreateSimonAsksCommentsTable < ActiveRecord::Migration
  def change
    create_table :simon_asks_comments do |t| 
      t.references :owner, polymorphic: true
      t.references :user
      t.text    :content
      t.string :state, limit: 50, default: 'pending'
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth
      t.timestamps
    end
    add_index :simon_asks_comments, [:owner_id, :owner_type]
    add_index :simon_asks_comments, :user_id
  end
end