module Api::V1
  class ApplicationController < ActionController::API
    include JSONAPI::ActsAsResourceController
  end
end
