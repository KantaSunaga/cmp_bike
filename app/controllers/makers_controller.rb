class MakersController < ApplicationController
  before_action :set_maker, only: [:show, :edit, :update, :destroy]
  before_action :checked_user?

  # GET /makers
  # GET /makers.json
  def index
    @makers = Maker.all
  end

  # GET /makers/1
  # GET /makers/1.json
  def show
  end

  # GET /makers/new
  def new
    @maker = Maker.new
    @year = Year.all
  end

  # GET /makers/1/edit
  def edit
    @year = Year.all
  end

  # POST /makers
  # POST /makers.json
  def create
    @maker = Maker.new(maker_params)
    if @maker.save
      redirect_to @maker, notice: 'Maker was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /makers/1
  # PATCH/PUT /makers/1.json
  def update
    if @maker.update(maker_params)
      redirect_to @maker, notice: 'Maker was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /makers/1
  # DELETE /makers/1.json
  def destroy
    @maker.destroy
    redirect_to makers_url, notice: 'Maker was successfully destroyed.'
  end

  private

  def checked_user?
    redirect_to admin_login_path if session[:id].blank?
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_maker
      @maker = Maker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maker_params
      params.require(:maker).permit(:maker_name, :year_id,:maker_comment)
    end
end
