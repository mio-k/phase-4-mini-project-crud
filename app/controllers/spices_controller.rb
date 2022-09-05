class SpicesController < ApplicationController
    def index
        spices = Spice.all 
        render json: spices
    end
    def update
        spice = find_spice
        if spice
            spice.update(spice_params)
            render json: spice
        else 
            handle_no_match
        end
    end

    def destroy
        spice = find_spice
        if spice
            spice.destroy
            head :no_content
        else 
            handle_no_match
        end
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
    def find_spice
        Spice.find_by(id: params[:id])
    end

    def handle_no_match
        render json: { error: "Spice not found"}, status: :not_found
    end
end
