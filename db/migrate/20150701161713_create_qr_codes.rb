class CreateQrCodes < ActiveRecord::Migration
  def change
    create_table :qr_codes do |t|
      t.text :location
      t.text :content
      t.integer :company_id

      t.timestamps null: false
    end
  end
end
