class AddProblemNumberToProblems < ActiveRecord::Migration[6.0]
  def change
    add_column :problems, :problem_number, :integer
  end
end
