module Api::V1
  class VehiclesController < ApplicationController
    before_action :set_vehicle, only: [:show, :update, :destroy]

    #Swagger Docs
    swagger_controller :vehicles, "Vehicle Management"

    swagger_api :index do
      summary "Fetches all Vehicles."
      notes "This lists all previously created Vehicles."
      param :path, :make_id, :integer, :optional, "Make Id"
      response :ok
    end

    swagger_api :show do
      summary "Fetches a Single Vehicle."
      notes "This retrieves a single vehicle and it's attributes."
      param :path, :id, :integer, :required, "Vehicle ID"
      response :not_found
    end

    swagger_api :create do
      summary "Creates a new Vehicle."
      notes "This endpoint adds a single new Vehicle."
      param :form, "vehicle[kind]", :string, :required, "Kind of Vehicle"
      response :created
      response :unprocessable_entity
    end

    swagger_api :update do
      summary "Update a Vehicle's Kind."
      notes "This allows you to change the Kind of vehicle it is."
      param :path, :id, :integer, :required, "Vehicle ID"
      param :form, "vehicle[kind]", :string, :required, "Kind of Vehicle"
      response :unprocessable_entity
      response :ok
      response :not_found
    end

    swagger_api :destroy do
      summary "Destroy a Vehicle."
      notes "This allows you to remove a Vehicle from the application."
      param :path, :id, :integer, :required, "Vehicle ID"
      response :not_found
      response :no_content
    end

    # GET /vehicles
    def index
      @vehicles = if (params[:make_id])
                    Make.find(params[:make_id]).vehicles
                  else
                    Vehicle.all
                  end

      render json: @vehicles
    end

    # GET /vehicles/1
    def show
      render json: @vehicle
    end

    # POST /vehicles
    def create
      @vehicle = Vehicle.new(vehicle_params)

      if @vehicle.save
        render json: @vehicle, status: :created, location: v1_vehicle_url(@vehicle)
      else
        render json: @vehicle.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /vehicles/1
    def update
      if @vehicle.update(vehicle_params)
        render json: @vehicle
      else
        render json: @vehicle.errors, status: :unprocessable_entity
      end
    end

    # DELETE /vehicles/1
    def destroy
      @vehicle.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_vehicle
        @vehicle = Vehicle.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def vehicle_params
        params.require(:vehicle).permit(:kind)
      end
  end
end
