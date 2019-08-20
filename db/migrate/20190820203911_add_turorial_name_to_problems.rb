class AddTurorialNameToProblems < ActiveRecord::Migration[6.0]
  def change
    add_column :problems, :tutorial, :string
  end
end
