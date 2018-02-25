module Api::V1
  class ModelsController < ApplicationController
    before_action :set_model, only: [:show, :update, :destroy]

    #Swagger Docs
    swagger_controller :models, "Model Management"

    swagger_api :index do
      summary "Fetches Models for a Specific Make."
      notes "This requires the make id to be specified in the URL."
      param :path, :make_id, :integer, :optional, "Make ID"
      response :ok
    end

    swagger_api :show do
      summary "Show a single Model."
      notes "This retrieves a single model and it's attributes."
      param :path, :id, :integer, :required, "Model ID"
      response :ok
      response :not_found
    end

    swagger_api :create do
      summary "Creates a new Model"
      notes "This endpoint adds a single new Model."
      param :form, "model[vehicle_id]", :integer, :required, "Kind of Vehicle"
      param :form, "model[make_id]", :integer, :required, "Manufacturer of Model"
      param :form, "model[name]", :string, :required, "Name of Model"
      param :form, "model[base_cost]", :float, :required, "Base Cost of Model"
      param :form, "model[year]", :integer, :required, "Model year"
      response :created
      response :unprocessable_entity
    end

    swagger_api :update do
      summary "Update a Model's Attributes."
      notes "This allows you to change the attributes of a Model."
      param :path, :id, :integer, :required, "Model ID"
      param :form, "model[vehicle_id]", :integer, :required, "Kind of Vehicle"
      param :form, "model[make_id]", :integer, :required, "Manufacturer of Model"
      param :form, "model[name]", :string, :required, "Name of Model"
      param :form, "model[base_cost]", :float, :required, "Base Cost of Model"
      param :form, "model[year]", :integer, :required, "Model year"
      response :ok
      response :not_found
      response :unprocessable_entity
    end

    swagger_api :destroy do
      summary "Destroy a Model"
      notes "This allows you to remove a Model from the application."
      param :path, :id, :integer, :required, "Model ID"
      response :no_content
      response :not_found
    end

    # GET /models
    def index
      @models = if(params[:make_id])
                  Make.find(params[:make_id]).models
                else
                  Model.all
                end

      render json: @models
    end

    # GET /models/1
    def show
      render json: @model
    end

    # POST /models
    def create
      @model = Model.new(model_params)

      if @model.save
        render json: @model, status: :created, location: v1_model_url(@model)
      else
        render json: @model.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /models/1
    def update
      if @model.update(model_params)
        render json: @model
      else
        render json: @model.errors, status: :unprocessable_entity
      end
    end

    # DELETE /models/1
    def destroy
      @model.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_model
        @model = Model.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def model_params
        params.require(:model).permit(:vehicle_id, :make_id, :name, :base_cost, :year)
      end
  end
end
