module Api::V1
  class OptionsController < ApplicationController
    before_action :set_option, only: [:show, :update, :destroy]

    #Swagger Docs
    swagger_controller :options, "Vehicle Management"

    swagger_api :index do
      summary "Fetches all Options."
      notes "This lists all previously created options. Optionally will return Options for a given Model."
      param :path, :model_id, :integer, :optional, "Model ID"
      response :ok
    end

    swagger_api :show do
      summary "Show a single Option."
      notes "This retrieves a single option and it's attributes."
      param :path, :id, :integer, :required, "Option ID"
      response :ok
      response :not_found
    end

    swagger_api :create do
      summary "Creates a new Option."
      notes "This endpoint adds a single new Option."
      param :form, "option[name]", :string, :required, "Name of Option"
      param :form, "option[cost]", :integer, :required, "Cost of Option"
      param :form, "option[description]", :string, :required, "Description of Option"
      param :form, "option[model_id]", :integer, :optional, "Model with this Option"
      response :created
      response :unprocessable_entity
    end

    swagger_api :update do
      summary "Update an Option's Attributes."
      notes "This allows you to change the attributes of an Option."
      param :path, :id, :integer, :required, "Option ID"
      param :form, "option[name]", :string, :required, "Name of Option"
      param :form, "option[cost]", :integer, :required, "Cost of Option"
      param :form, "option[description]", :string, :required, "Description of Option"
      param :form, "option[model_id]", :integer, :optional, "Model with this Option"
      response :ok
      response :unprocessable_entity
    end

    swagger_api :destroy do
      summary "Destroy an Option."
      notes "This allows you to remove an Option from the application."
      param :path, :id, :integer, :required, "Option ID"
      response :not_found
      response :no_content
    end


    # GET /options
    def index
      @options = if(params[:model_id])
                   Model.find(params[:model_id]).options
                 else
                   Option.all
                 end
      render json: @options
    end

    # GET /options/1
    def show
      render json: @option
    end

    # POST /options
    def create
      @option = Option.new(option_params)

      if @option.save
        render json: @option, status: :created, location: v1_option_url(@option)
      else
        render json: @option.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /options/1
    def update
      if @option.update(option_params)
        render json: @option
      else
        render json: @option.errors, status: :unprocessable_entity
      end
    end

    # DELETE /options/1
    def destroy
      @option.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_option
        @option = Option.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def option_params
        params.require(:option).permit(:cost, :name, :description)
      end
  end
end
