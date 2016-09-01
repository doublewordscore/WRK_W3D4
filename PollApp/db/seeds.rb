# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

User.destroy_all
user1 = User.create!(user_name: Faker::Name.name)
user2 = User.create!(user_name: Faker::Name.name)
user3 = User.create!(user_name: Faker::Name.name)
user4 = User.create!(user_name: Faker::Name.name)
user5 = User.create!(user_name: Faker::Name.name)
user6 = User.create!(user_name: Faker::Name.name)
user7 = User.create!(user_name: Faker::Name.name)


Poll.destroy_all
poll1 = Poll.create!(title: Faker::Music.instrument, author_id: user1.id)
poll2 = Poll.create!(title: Faker::Music.instrument, author_id: user1.id)
poll3 = Poll.create!(title: Faker::Music.instrument, author_id: user3.id)
poll4 = Poll.create!(title: Faker::Music.instrument, author_id: user6.id)

Question.destroy_all
question_p1_1 = Question.create!(text: Faker::Lorem.sentence, poll_id: poll1.id)
question_p1_2 = Question.create!(text: Faker::Lorem.sentence, poll_id: poll1.id)
question_p1_3 = Question.create!(text: Faker::Lorem.sentence, poll_id: poll1.id)
question_p1_4 = Question.create!(text: Faker::Lorem.sentence, poll_id: poll1.id)
question_p2_1 = Question.create!(text: Faker::Lorem.sentence, poll_id: poll2.id)
question_p2_2 = Question.create!(text: Faker::Lorem.sentence, poll_id: poll2.id)
question_p3_1 = Question.create!(text: Faker::Lorem.sentence, poll_id: poll3.id)
question_p3_2 = Question.create!(text: Faker::Lorem.sentence, poll_id: poll3.id)
question_p4_1 = Question.create!(text: Faker::Lorem.sentence, poll_id: poll4.id)
question_p4_2 = Question.create!(text: Faker::Lorem.sentence, poll_id: poll4.id)

AnswerChoice.destroy_all
answer_choice_p1_q1_1 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p1_1.id)
answer_choice_p1_q1_2 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p1_1.id)
answer_choice_p1_q1_3 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p1_1.id)
answer_choice_p1_q2_1 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p1_2.id)
answer_choice_p1_q2_2 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p1_2.id)
answer_choice_p1_q3_1 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p1_3.id)
answer_choice_p1_q3_2 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p1_3.id)
answer_choice_p1_q4_1 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p1_4.id)
answer_choice_p1_q4_2 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p1_4.id)

answer_choice_p2_q1_1 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p2_1.id)
answer_choice_p2_q1_2 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p2_1.id)
answer_choice_p2_q2_1 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p2_2.id)
answer_choice_p2_q2_2 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p2_2.id)

answer_choice_p3_q1_1 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p3_1.id)
answer_choice_p3_q1_2 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p3_1.id)
answer_choice_p3_q2_1 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p3_2.id)
answer_choice_p3_q2_2 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p3_2.id)

answer_choice_p4_q1_1 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p4_1.id)
answer_choice_p4_q1_2 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p4_1.id)
answer_choice_p4_q1_3 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p4_1.id)
answer_choice_p4_q2_1 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p4_2.id)
answer_choice_p4_q2_2 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p4_2.id)
answer_choice_p4_q2_3 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p4_2.id)
answer_choice_p4_q2_4 = AnswerChoice.create!(answer: Faker::Beer.name, question_id: question_p4_2.id)

Response.destroy_all

responses_p2_u7_1 = Response.create!(user_id: user7.id, answer_id: answer_choice_p2_q1_1.id)
responses_p2_u7_2 = Response.create!(user_id: user7.id, answer_id: answer_choice_p2_q2_1.id)

# responses_p2_u7_1 = Response.create!(user_id: user7.id, answer_id: answer_choice_p2_q1_1.id)
# responses_p2_u7_2 = Response.create!(user_id: user7.id, answer_id: answer_choice_p2_q2_1.id)
#
# responses_p2_u6_1 = Response.create!(user_id: user6.id, answer_id: answer_choice_p2_q1_2.id)
# responses_p2_u6_2 = Response.create!(user_id: user6.id, answer_id: answer_choice_p2_q2_2.id)
#
# responses_p2_u5_1 = Response.create!(user_id: user5.id, answer_id: answer_choice_p2_q1_1.id)
# responses_p2_u5_2 = Response.create!(user_id: user5.id, answer_id: answer_choice_p2_q2_2.id)
#
# responses_p3_u5_1 = Response.create!(user_id: user5.id, answer_id: answer_choice_p3_q1_1.id)
# responses_p3_u5_2 = Response.create!(user_id: user5.id, answer_id: answer_choice_p3_q2_1.id)
#
# responses_p3_u4_1 = Response.create!(user_id: user4.id, answer_id: answer_choice_p3_q1_2.id)
# responses_p3_u4_2 = Response.create!(user_id: user4.id, answer_id: answer_choice_p3_q2_2.id)
#
# responses_p3_u2_1 = Response.create!(user_id: user2.id, answer_id: answer_choice_p3_q1_1.id)
# responses_p3_u2_2 = Response.create!(user_id: user2.id, answer_id: answer_choice_p3_q2_2.id)





# create_table "answerchoices", force: :cascade do |t|
#   t.string   "answer",      null: false
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.integer  "question_id", null: false
# end
#
# create_table "polls", force: :cascade do |t|
#   t.string   "title",      null: false
#   t.string   "author",     null: false
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
#
# add_index "polls", ["title"], name: "index_polls_on_title", using: :btree
#
# create_table "questions", force: :cascade do |t|
#   t.text     "text",       null: false
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.integer  "poll_id",    null: false
# end
#
# create_table "responses", force: :cascade do |t|
#   t.integer  "user_id",    null: false
#   t.integer  "answer_id",  null: false
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
#
# create_table "users", force: :cascade do |t|
#   t.string   "user_name",  null: false
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
#
# add_index "users", ["user_name"], name: "index_users_on_user_name", unique: true, using: :btree
