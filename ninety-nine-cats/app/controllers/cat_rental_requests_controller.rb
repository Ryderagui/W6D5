class CatRentalRequestsController < ApplicationController
    def create
        cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
        if (cat_rental_request.save)
            render json: cat_rental_request
        else
            render json: cat_rental_request.errors.full_messages, status: :unprocessable_content
        end
    end

    def new 
        @cats = Cat.all
        render :new 
    end


    private

    def cat_rental_request_params
        params.require(:cat_rental_request).permit(:start_date, :end_date, :status, :cat_id)
    end
end
