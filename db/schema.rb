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

ActiveRecord::Schema.define(:version => 20130708224009) do

  create_table "answers", :force => true do |t|
    t.text     "text",                           :null => false
    t.integer  "question_id",                    :null => false
    t.integer  "user_id",                        :null => false
    t.boolean  "anonymous",   :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"
  add_index "answers", ["user_id"], :name => "index_answers_on_user_id"

  create_table "questions", :force => true do |t|
    t.string   "title",                          :null => false
    t.text     "description"
    t.integer  "asker_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "anonymous",   :default => false
  end

  add_index "questions", ["asker_id"], :name => "index_questions_on_asker_id"

  create_table "questions_topics", :id => false, :force => true do |t|
    t.integer "question_id", :null => false
    t.integer "topic_id",    :null => false
  end

  add_index "questions_topics", ["question_id"], :name => "index_questions_topics_on_question_id"
  add_index "questions_topics", ["topic_id"], :name => "index_questions_topics_on_topic_id"

  create_table "topics", :force => true do |t|
    t.string   "title",       :null => false
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.string   "name"
    t.string   "bio"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "user_id",                 :null => false
    t.integer  "answer_id",               :null => false
    t.integer  "count",      :limit => 2
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "votes", ["answer_id"], :name => "index_votes_on_answer_id"
  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

end
