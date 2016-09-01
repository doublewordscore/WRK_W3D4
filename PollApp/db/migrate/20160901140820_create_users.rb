class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, null: false

      t.timestamps
    end
    add_index :users, :user_name, unique: true

    create_table :polls do |t|
      t.string :title, null: false
      t.string :author, null: false

      t.timestamps
    end
    add_index :polls, :title

    create_table :questions do |t|
      t.text :text, null: false

      t.timestamps
    end

    create_table :answerchoices do |t|
      t.string :answer, null: false

      t.timestamps
    end

    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :answer_id, null: false

      t.timestamps
    end

  end

end
