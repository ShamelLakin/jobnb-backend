class Api::V1::CompaniesController < ApplicationController

    def index
        companies = Company.all
        render json: {
            companies: CompanySerializer.new(companies).serializable_hash
        }
    end

    def create
        company = Company.new(company_params) 
        if company.save
            render json: {
                company: CompanySerializer.new(company).serializable_hash,
                message: "Created company successfully"
            }
        else
            render json: {
                error: company.errors.full_messages.to_sentence
            }
        end
    end

    private

    def company_params 
        params.permit(:name, :image_url)
    end

end
