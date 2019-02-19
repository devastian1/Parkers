class LocationController < ApplicationController
	
	def new
		# @car = Car.find(params[:id])
		@car = Car.where(user_id: @user)
	end
	
	def edit
	end

	def create
		@location = Location.new
		@car = Car.find(params[:id])
		@location.latitude = request.location.latitude 
		@location.longitude = request.location.longitude
		@location.ip_address = request.remote_ip
		@location.car_id = @car.id

		respond_to do |format|
      if @location.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
	end

private

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:latitude, :longitude, :ip_address, :car_id)
    end

    
end