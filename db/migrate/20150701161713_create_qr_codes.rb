class CreateQrCodes < ActiveRecord::Migration
  def change
    create_table :qr_codes do |t|
      t.text :title
      t.text :body
      t.integer :company_id

      t.timestamps null: false
    end
  end
end
