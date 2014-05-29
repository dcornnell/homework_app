class LocationsController < ApplicationController
	load_and_authorize_resource param_method: :location_params
	def new
		@new_location = Location.new
	end

	def create
		
			@new_location = Location.new(location_params)
			if @new_location.save
				redirect_to locations_path
			else
				render new_location_path, notice: "the location has not been added"
			end
	end

	def index 
		@locations = Location.all
	end

	private

	def location_params
		params.require(:location).permit!
	end
end
