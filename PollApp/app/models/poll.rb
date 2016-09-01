# create_table "polls", force: :cascade do |t|
#   t.string   "title",      null: false
#   t.string   "author_id",     null: false
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
#
# add_index "polls", ["title"], name: "index_polls_on_title", using: :btree

class Poll < ActiveRecord::Base
  validates :author_id, presence: true

  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :questions,
    class_name: 'Question',
    foreign_key: :poll_id,
    primary_key: :id
  )

end
