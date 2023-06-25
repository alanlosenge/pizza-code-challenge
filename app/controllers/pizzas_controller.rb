class PizzasController < ApplicationController
    def index
      # Retrieve all pizzas from the database
      pizza = Pizza.all
      # Render the pizzas as JSON
      render json: pizza
    end
  
    def show
      # Find a specific pizza by its ID
      pizzas = Pizza.find_by(id: params[:id])
      # Render the pizza as JSON
      render json: pizzas
    end
  
    def create
      # Create a new pizza with the provided parameters
      pizza = Pizza.create(pizza_params)
      # Render the created pizza as JSON
      render json: pizza
    end
  
    def update
      # Find a specific pizza by its ID
      pizza = Pizza.find(params[:id])
      # Update the pizza with the provided parameters
      pizza.update(pizza_params)
      # Render the updated pizza as JSON
      render json: pizza
    end
  
    def destroy
      # Find a specific pizza by its ID
      pizza = Pizza.find(params[:id])
      # Destroy (delete) the pizza from the database
      pizza.destroy
      # Render the destroyed pizza as JSON
      render json: pizza
    end
  
    private
  
    # Define the permitted parameters for creating/updating a pizza
    def pizza_params
      params.require(:pizza).permit(:name, :ingredients)
    end
  end
  