require 'byebug'

class Response < ActiveRecord::Base

  # create_table "responses", force: :cascade do |t|
  #   t.integer  "user_id",    null: false
  #   t.integer  "answer_id",  null: false
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  # end

  validates :user_id, :answer_id, presence: true
  validate :respondent_already_answered
  validate :author_response_prevention

  belongs_to(
    :answer_choice,
    class_name: 'AnswerChoice',
    foreign_key: :answer_id,
    primary_key: :id
  )

  belongs_to(
    :respondent,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )


  def sibling_responses
    self.question.answers.where.not(id: self.id)
  end

  def respondent_already_answered
    if sibling_responses.exists?(user_id: self.user_id)
      errors[:already_answered] << "You have already answered this question"
    end
  end

  def author_response_prevention
    if self.answer_choice.question.poll.author.id == self.user_id
      errors[:respondent_created_poll] << "You created this poll!"
    end
  end

end
