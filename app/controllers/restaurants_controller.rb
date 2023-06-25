class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    def index
      restaurants = Restaurant.all
      render json: restaurants
    end
  
    def show    
      restaurant = Restaurant.find_by(id: params[:id])
      if restaurant
        render json: restaurant
      else
        render json: { error: "Restaurant not found" }, status: :not_found
      end
    end
  
    def destroy
      restaurant = Restaurant.find(params[:id])
      restaurant.destroy
      head :no_content
    end
  
    private
  
    def render_not_found_response
      render json: { error: "Restaurant not found" }, status: :not_found
    end
end
