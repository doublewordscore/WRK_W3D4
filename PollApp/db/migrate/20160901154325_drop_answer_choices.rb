class DropAnswerChoices < ActiveRecord::Migration
  def change
    drop_table :answerchoices
    
  end
end
