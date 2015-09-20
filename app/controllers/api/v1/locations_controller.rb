# class Api::V1::LocationsController < ApplicationController
# end
module Api
  module V1
    class LocationsController < ApplicationController
      skip_before_filter  :verify_authenticity_token

      def create
        user = User.find(params[:user_id])
        location = user.locations.create(address: params[:address], latitude: params[:latitude], longitude: params[:longitude])
        if location.save
           render :json => {:status => 200}.to_json
        end
      end
    end
  end
end