# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130427201635) do

  create_table "simon_asks_comments", :force => true do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "user_id"
    t.text     "content"
    t.string   "state",      :limit => 50, :default => "pending"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  add_index "simon_asks_comments", ["owner_id", "owner_type"], :name => "index_simon_asks_comments_on_owner_id_and_owner_type"
  add_index "simon_asks_comments", ["user_id"], :name => "index_simon_asks_comments_on_user_id"

  create_table "simon_asks_question_answers", :force => true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.integer  "question_id"
    t.integer  "comments_count"
    t.integer  "cached_votes_score", :default => 0
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.boolean  "accepted",           :default => false
  end

  add_index "simon_asks_question_answers", ["cached_votes_score"], :name => "index_simon_asks_question_answers_on_cached_votes_score"

  create_table "simon_asks_questions", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.boolean  "marked",             :default => false
    t.integer  "answers_count",      :default => 0
    t.integer  "comments_count",     :default => 0
    t.integer  "views_count",        :default => 0
    t.string   "image"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "cached_votes_score", :default => 0
  end

  add_index "simon_asks_questions", ["cached_votes_score"], :name => "index_simon_asks_questions_on_cached_votes_score"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], :name => "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["votable_id", "votable_type"], :name => "index_votes_on_votable_id_and_votable_type"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], :name => "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end
