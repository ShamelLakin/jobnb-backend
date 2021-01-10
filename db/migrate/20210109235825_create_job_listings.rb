class CreateJobListings < ActiveRecord::Migration[6.0]
  def change
    create_table :job_listings do |t|
      t.string :title
      t.string :description
      t.string :phone_number
      t.belongs_to :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
