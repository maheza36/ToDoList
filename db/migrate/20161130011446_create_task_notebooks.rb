class CreateTaskNotebooks < ActiveRecord::Migration[5.0]
  def change
    create_table :task_notebooks do |t|
      t.integer :notebook_id
      t.integer :homework_id

      t.timestamps
    end
  end
end
