class CreateJobApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :job_applications do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone
      t.string :alternate_phone
      t.integer :user_id
      t.timestamps
    end
  end
end
