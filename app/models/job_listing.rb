class JobListing < ApplicationRecord
  validates :phone_number, uniqueness: true

  belongs_to :company
end
