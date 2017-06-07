class RoadbikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]
  before_action :checked_user?

  # GET /bikes
  # GET /bikes.json
  def index
    @bikes = Roadbike.all
  end

  # GET /bikes/1
  # GET /bikes/1.json
  def show
  end

  # GET /bikes/new
  def new
    @bike = Roadbike.new
  end

  # GET /bikes/1/edit
  def edit
    @makers = Maker.all
    @roadbike = Roadbike.all
  end

  # POST /bikes
  # POST /bikes.json
  def create
    @bike = Roadbike.new(bike_params)
      if @bike.save
        redirect_to @bike, notice: 'Bike was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /bikes/1
  # PATCH/PUT /bikes/1.json
  def update
      if @bike.update(bike_params)
        redirect_to @bike, notice: 'Bike was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /bikes/1
  # DELETE /bikes/1.json
  def destroy
    @bike.destroy
     redirect_to roadbikes_path, notice: 'Bike was successfully destroyed.'
  end

  private
  def checked_user?
    redirect_to admin_login_path if session[:id].blank?
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_bike
      @bike = Roadbike.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bike_params
      params.require(:roadbike).permit(:maker_id, :bike_series, :bike_name, :frame_type, :component,
                                        :rear_derailleur, :front_derailleur, :crank, :brake, :chain,
                                        :sprocket, :sti_lever, :bb, :wheel, :saddle, :seat_pillar,
                                        :handle, :stem, :tire, :pedal, :valve, :accessory, :maker_url,
                                        :shop_url, :sex,:brake_type)
    end
end
