class Company < ApplicationRecord
    validates :name, uniqueness: true

    has_many :job_listings
end
