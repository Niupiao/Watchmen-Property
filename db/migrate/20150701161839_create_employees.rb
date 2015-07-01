class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.text :name
      t.text :username
      t.text :password_digest
      t.integer :employer_id

      t.timestamps null: false
    end
  end
end
