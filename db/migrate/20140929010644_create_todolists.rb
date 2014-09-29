class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|
      t.string :todolist_name
      t.integer :user_id

      t.timestamps
    end
  end
end
