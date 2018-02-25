module Swagger::Docs
  class Config
    def self.base_api_controller
      Api::V1::ApplicationController
    end
  end
end

Swagger::Docs::Config.register_apis(
  {
    "1.0" => {
      api_extension_type: :json,
      api_file_path: "public",
      base_path: 'http://localhost:3000',
      clean_directory: false,
      attributes: {
        "title" => "Vehicles API",
        "description" => "Sample API for Vehicles.",
        "formatting" => :pretty,
        "contact" => "shadself@gmail.com",
        "license" => "Apache 2.0",
        "licenseUrl" => "http://www.apache.org/licenses/LICENSE-2.0.html"
      }
    }
  }
)
