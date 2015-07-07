class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.text :location

      t.timestamps null: false
    end
  end
end
