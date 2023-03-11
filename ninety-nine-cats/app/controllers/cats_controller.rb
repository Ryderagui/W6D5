class CatsController < ApplicationController
    def show 
        @cat = Cat.find_by(id: params[:id])
        @cat_rental_requests = CatRentalRequest.where("cat_id = ?",@cat.id).order(:start_date) #{}
        render :show
    
    end 

    def index  
        @cats = Cat.all
        render :index
    end 
end
