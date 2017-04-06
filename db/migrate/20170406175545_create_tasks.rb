class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :text
      t.datetime :start_date
      t.integer :duration
      t.integer :parent
      t.string :status
      t.string :user
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
