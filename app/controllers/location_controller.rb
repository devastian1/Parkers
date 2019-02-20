class LocationController < ApplicationController
	skip_before_action :verify_authenticity_token
	def new
		# @car = Car.all 
		@car = Car.where(user_id: current_user.id)
	end
	
	def edit
	end

	def update
	end

	def create
		@location = Location.new
		@car = Car.where(user_id: current_user.id)
		@location.ip_address = request.remote_ip
		# @location.car_id = params[:car_id]
		sleep 3.5
       	@location.latitude = params[:latitude]
       	@location.longitude = params[:longitude]
        @location.car_id = params[:car_id]
      if @location.save
		respond_to do |format|
        format.json { render :json => {:latitude =>@location.latitude, :longitude => @location.longitude}, status: :created }
        format.html { redirect_to '/', notice: 'Location Successfully Updated' }
       	@location.save
      	# 
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