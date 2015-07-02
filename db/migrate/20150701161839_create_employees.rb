class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.text :name
      t.text :username, unique: true
      t.text :password_digest
      t.integer :employer_id
      t.text :auth
      t.timestamps :auth_expires_at

      t.timestamps null: false
    end
  end
end
