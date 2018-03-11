class CreateApplicants < ActiveRecord::Migration[5.1]
  def change
    create_table :applicants do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :zip_code
      t.boolean :over_18
      t.string :phone_type


      t.timestamps
    end
  end
end
