# class Api::V1::DestinationsController < ApplicationController
# end
module Api
  module V1
    class DestinationsController < ApplicationController
      skip_before_filter  :verify_authenticity_token

      def create
        user = User.find(params[:user_id])
        destination = user.destinations.create(address: params[:address], latitude: params[:latitude], longitude: params[:longitude])
        if destination.save
           render :json => {:status => 200}.to_json
        end
      end
    end
  end
end