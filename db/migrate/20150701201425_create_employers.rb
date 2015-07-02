class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.text :name
      t.text :company_name
      t.text :username, unique: true
      t.text :password_digest
      t.text :auth

      t.timestamps null: false
    end
  end
end
