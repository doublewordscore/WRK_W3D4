class Question < ActiveRecord::Base
  # create_table "questions", force: :cascade do |t|
  #   t.text     "text",       null: false
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  #   t.integer  "poll_id",    null: false
  # end

  validates :poll_id, presence: true
  validates :text, presence: true

  has_many(
    :answer_choices,
    class_name: 'AnswerChoice',
    foreign_key: :question_id,
    primary_key: :id
  )

  belongs_to(
    :poll,
    class_name: 'Poll',
    foreign_key: :poll_id,
    primary_key: :id
  )

  has_many(
    :answers,
    through: :answer_choices,
    source: :responses
  )

  def results
    results_hash = Hash.new(0)
    choices = self.answer_choices.includes(:responses)
    choices.each do |choice|
      results_hash[choice.answer] = choice.responses.length
    end
    results_hash
  end


  # AnswerChoice.find_by_sql(<<-SQL)
  #   SELECT
  #   answer_choices.*, COUNT(*) AS num_responses
  # FROM
  #   answer_choices
  # LEFT OUTER JOIN
  #   responses ON answer_choices.id = responses.answer_id
  # JOIN
  #   questions ON questions.id = answer_choices.question_id
  # GROUP BY
  #   responses.answer_id;
  # SQL
  def results2
    result = AnswerChoice.find_by_sql(<<-SQL, self.id)
    SELECT
      answer_choices.answer, count(responses.id)
    FROM
      answer_choices
    LEFT OUTER JOIN
      responses ON responses.answer_id = answer_choices.id
    WHERE
      answer_choices.question_id = ?
    GROUP BY
      answer_choices.id;
    SQL
    result
  end

  def results3
    hash = {}
    results = self
      .answer_choices
      .select("answer_choices.answer, count(responses.id) AS votes")
      .joins("LEFT OUTER JOIN responses ON responses.answer_id = answer_choices.id")
      .where("answer_choices.question_id = ?", self.id)
      .group("answer_choices.id")

    results.each do |result|
      hash[result.answer] = result.votes
    end
    hash
  end



end
