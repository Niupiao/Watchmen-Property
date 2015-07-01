class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :qr_code_id
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
