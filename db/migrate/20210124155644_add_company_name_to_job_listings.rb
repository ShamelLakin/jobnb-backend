class AddCompanyNameToJobListings < ActiveRecord::Migration[6.0]
  def change
    add_column :job_listings, :company_name, :string
  end
end
