class AnswerChoice < ActiveRecord::Base

  # create_table "answer_choices", force: :cascade do |t|
  #   t.string   "answer",      null: false
  #   t.integer  "question_id", null: false
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  # end
  #
  # add_index "answer_choices", ["question_id"], name: "index_answer_choices_on_question_id", using: :btree


  validates :answer, :question_id, presence: true

  belongs_to(
    :question,
    class_name: "Question",
    foreign_key: :question_id,
    primary_key: :id
  )

  has_many(
    :responses,
    class_name: "Response",
    foreign_key: :answer_id,
    primary_key: :id
  )

end
