class CreateProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :problems do |t|
      t.string :chapter_name
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
