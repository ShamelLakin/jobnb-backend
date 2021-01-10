class CompanySerializer
  include JSONAPI::Serializer
  attributes :name, :job_listings
end
