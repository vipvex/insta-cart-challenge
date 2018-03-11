class CreateApplicants < ActiveRecord::Migration[5.1]
  def change
    create_table :applicants do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :zip_code, null: false
      t.boolean :over_18, null: false
      t.string :phone_type, null: false
      t.boolean :confirmed_background_check, default: false

      t.timestamps
    end
  end
end
