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
                message: "Couldn't create company, try again"
            }
        end
    end

    private

    def company_params 
        params.require(:company).permit(:name)
    end

end
