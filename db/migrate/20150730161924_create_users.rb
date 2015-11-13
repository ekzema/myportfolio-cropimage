class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :name
      t.string :email
      t.string :last_name
      t.string :phone
      t.datetime :birth
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
