class JobListingSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :phone_number, :company_id, :company_name
end
