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
    @makers = Maker.all
    @component = [["S-Series",1],["SRAM Apex" , 2],["SRAM Apex 1" , 3],["SRAM Rival" ,4],["SRAM Rival 1" , 5],["SRAM Force" , 6],
                  ["SRAM Force 1" , 7],["SRAM RED" ,8],["SRAM RED eTAP" , 9],["DURA-ACE" , 10],["ULTEGRA" , 11],["105" , 12],
                  ["TIAGRA" , 13],["SORA" , 14],["CLARIS ", 15],["DURA-ACE DI2" , 16],["ULTEGRA DI2" , 17],
                  ["SuperRecord EPS" , 18],["SuperRecord" ,  19],["Record EPS" , 20],["Record" , 21 ],["Chorus EPS" , 22],
                  ["Chorus" , 23],["Athena" , 24],["Potenza"  , 25],["Veloce" , 26]
                ]
  end

  # GET /bikes/1/edit
  def edit
    @makers = Maker.all
    @roadbike = Roadbike.all
    @component = [["S-Series",1],["SRAM Apex" , 2],["SRAM Apex 1" , 3],["SRAM Rival" ,4],["SRAM Rival 1" , 5],["SRAM Force" , 6],
                  ["SRAM Force 1" , 7],["SRAM RED" ,8],["SRAM RED eTAP" , 9],["DURA-ACE" , 10],["ULTEGRA" , 11],["105" , 12],
                  ["TIAGRA" , 13],["SORA" , 14],["CLARIS ", 15],["DURA-ACE DI2" , 16],["ULTEGRA DI2" , 17],
                  ["SuperRecord EPS" , 18],["SuperRecord" ,  19],["Record EPS" , 20],["Record" , 21 ],["Chorus EPS" , 22],
                  ["Chorus" , 23],["Athena" , 24],["Potenza"  , 25],["Veloce" , 26]
                ]
  end

  # POST /bikes
  # POST /bikes.json
  def create

    pedal= false
    pedal = true if bike_params[:pedal] == 2

    sex = false
    sex = true if params[:sex] == 2

    @bike = Roadbike.new(bike_params)
    if @bike.save
      @bike.update(sex: sex, pedal: pedal )
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
