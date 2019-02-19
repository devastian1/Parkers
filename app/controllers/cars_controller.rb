class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  # before_action :authorize, except: [:show, :edit, :update, :destroy, :welcome]

  # GET /cars
  # GET /cars.json
  def index 
  @client_ip = remote_ip()
  @cars = Car.search(params[:search]) 

    respond_to do |format|
        format.html { render action: "index" }
        format.js # remote: true is sent a js format and sends you to search.js.erb
    end
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    @car = Car.find(params[:id])
    @locations = Location.where(car_id: @car)
    @location = @locations.last
    respond_to do |format|
        format.html { render action: "show" }
        format.js # remote
      end
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  def welcome
  @cars = Car.search(params[:search])
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)
    @car.plate_number = params[:car][:plate_number].upcase
    @car.user_id = current_user.id
    @car.ip_address = request.remote_ip

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:model, :color, :plate_number, :ip_address, :lat, :lon)
    end

    
end
