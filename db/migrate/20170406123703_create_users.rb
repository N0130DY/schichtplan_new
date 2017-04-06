class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :vorname
      t.string :nachname
      t.string :email
      t.string :rechte
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
