class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.integer :todolist_id
      t.datetime :deadline
      t.boolean :completed, default: false
      t.integer :priority, default: 0

      t.timestamps
    end
  end
end
