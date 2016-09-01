# create_table "users", force: :cascade do |t|
#   t.string   "user_name",  null: false
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
#
# add_index "users", ["user_name"], name: "index_users_on_user_name", unique: true, using: :btree


class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true

  has_many(
    :authored_polls,
    class_name: 'Poll',
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :responses,
    class_name: 'Response',
    foreign_key: :user_id,
    primary_key: :id
  )

  def completed_polls
  end

  SELECT
    polls.*, COUNT(questions.id), COUNT(r.*)
  FROM
    polls
  JOIN
    questions ON questions.poll_id = polls.id
  LEFT OUTER JOIN(
    SELECT
      *
    FROM
      responses
    WHERE
      responses.user_id = 84
    ) AS r ON r.answer_id = answer_choices.id
  GROUP BY
    polls.id
  HAVING
    COUNT(questions.id) = COUNT(r.*);
end
