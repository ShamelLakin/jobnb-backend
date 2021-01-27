class Company < ApplicationRecord
    validates :name, uniqueness: true, presence: true
    

    has_many :job_listings
end
