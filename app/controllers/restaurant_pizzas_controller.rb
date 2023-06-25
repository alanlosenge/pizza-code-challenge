class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
      
    def create
      pizza = Pizza.find(params[:pizza_id])
      restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params.merge(price: pizza.price))
      render json: pizza
    rescue ActiveRecord::RecordInvalid => invalid
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
  
    private
  
    def restaurant_pizza_params
      params.permit(:restaurant_id, :pizza_id)
    end
end
