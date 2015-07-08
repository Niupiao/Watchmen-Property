class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.text :location
      t.int :company_id

      t.timestamps null: false
    end
  end
end
