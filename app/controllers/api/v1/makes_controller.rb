module Api::V1
  class MakesController < ApplicationController
    before_action :set_make, only: [:show, :update, :destroy]

    #Swagger Docs
    swagger_controller :makes, "Make Management"

    swagger_api :index do
      summary "Fetches all Makes."
      notes "This lists all previously created Makes."
      response :ok
    end

    swagger_api :show do
      summary "Fetches a Single Make."
      notes "This retrieves a single make and it's attributes."
      param :path, :id, :integer, :required, "Make ID"
      response :ok
      response :not_found
    end

    swagger_api :create do
      summary "Creates a new Make."
      notes "This endpoint adds a single Make/Manufacturer."
      param :form, "make[manufacturer]", :string, :required, "Name of Manufacturer"
      response :created
      response :unprocessable_entity
    end

    swagger_api :update do
      summary "Update a Make's Manufacturer."
      notes "This allows you to change the Manufacturer name for a Make."
      param :path, :id, :integer, :required, "Make ID"
      response :ok
      response :unprocessable_entity
    end

    swagger_api :destroy do
      summary "Destroy a Make."
      notes "This allows you to remove a Make from the application."
      param :path, :id, :integer, :required, "Make ID"
      response :not_found
      response :no_content
    end

    # GET /makes
    def index
      @makes = Make.all

      render json: @makes
    end

    # GET /makes/1
    def show
      render json: @make
    end

    # POST /makes
    def create
      @make = Make.new(make_params)

      if @make.save
        render json: @make, status: :created, location: v1_make_url(@make)
      else
        render json: @make.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /makes/1
    def update
      if @make.update(make_params)
        render json: @make
      else
        render json: @make.errors, status: :unprocessable_entity
      end
    end

    # DELETE /makes/1
    def destroy
      @make.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_make
        @make = Make.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def make_params
        params.require(:make).permit(:manufacturer)
      end
  end
end
