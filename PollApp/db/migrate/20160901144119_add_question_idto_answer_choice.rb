class AddQuestionIdtoAnswerChoice < ActiveRecord::Migration
  def change
    add_column :answerchoices, :question_id, :integer, null: false
  end
end
