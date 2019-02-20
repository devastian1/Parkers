class LocationController < ApplicationController
	skip_before_action :verify_authenticity_token
	def new
		@car = Car.all 
		# @car = Car.where(user_id: current_user.id)
	end
	
	def edit
	end

	def update
	end

	def create
		@location = Location.new
		@car = Car.where(user_id: current_user.id)
		@location.ip_address = request.remote_ip
		# @location.car_id = @car.id
		sleep 3.5
       	@location.latitude = params[:latitude]
       	@location.longitude = params[:longitude]
		respond_to do |format|
      if @location.save
        format.html { redirect_to '/', notice: 'Location Successfully Updated' }
        format.json { render :show, status: :created, location: @car }
       	@location.save
      	# render :json => {:latitude =>@location.latitude, :longitude => @location.longitude}, status: :created
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