class Api::V1::JobListingsController < ApplicationController

    def index 
        if params[:company_id]
            company = Company.find(params[:company_id])
            job_listings = company.job_listings 
            render json: {
                job_listings: JobListingSerializer.new(job_listings).serializable_hash
            }
        else
            job_listings = JobListing.all
            render json: {
                job_listings: JobListingSerializer.new(job_listings).serializable_hash
            }
        end
    end

    def create 
        if params[:company_id]
            company = Company.find(params[:company_id])
            job_listing = company.job_listings.build(job_listings_params)
            if job_listing.save
                render json: {
                    job_listing: JobListingSerializer.new(job_listing).serializable_hash,
                    status: 200
                }
            else
                render json: {
                    message: "Couldn't create job listing, try again",
                    errors: company.errors.full_messages,
                    status: 400
                }
            end
        else
            render json: {
                message: "Couldn't find company with that ID",
                status: 404
            }
        end
    end

    def update  
        if params[:company_id]
            company = Company.find(params[:company_id])
            job_listing = company.job_listings.find(params[:id])
            job_listing.update(job_listings_params) 
            if company.save && job_listing.save 
                render json: {
                    job_listing: JobListingSerializer.new(job_listing).serializable_hash,
                    status: 200
                }
            else
                render json: {
                    message: "Couldn't update that job listing",
                    status: 400
                }
            end
        else
            render json: {
                message: "Couldn't find company with that ID",
                status: 404
            }
        end
    end

    def destroy 
        if params[:company_id]
            company = Company.find(params[:company_id])
            job_listing = company.job_listings.find(params[:id])
            job_listing.destroy
            render json: {
                job_listing: JobListingSerializer.new(job_listing).serializable_hash,
                message: "Job listing deleted",
                status: 200
            }
        end
    end

    private
    
    def job_listings_params
        params.permit(:title, :description, :phone_number, :company_name)
    end

end
