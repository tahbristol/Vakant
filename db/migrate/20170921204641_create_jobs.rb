class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :location
      t.string :description
      t.string :level
      t.string :salary
      t.integer :organization_id
      t.timestamps
    end
  end
end
