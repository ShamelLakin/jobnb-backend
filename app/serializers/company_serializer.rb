class CompanySerializer
  include JSONAPI::Serializer
  attributes :name, :image_url, :job_listings
end
