class MangementsController < ApplicationController
  before_action :set_mangement, only: [:show, :edit, :update, :destroy]
  before_action :checked_user?

  # GET /mangements/1
  # GET /mangements/1.json
  def show
  end

  # GET /mangements/new
  def new
    @mangement = Mangement.new
  end

  # GET /mangements/1/edit
  def edit
  end

  # POST /mangements
  # POST /mangements.json
  def create
    @mangement = Mangement.new(mangement_params)
    if @mangement.save
      redirect_to @mangement, notice: 'ユーザーが作成されました'
    else
      render :new
    end
  end

  # PATCH/PUT /mangements/1
  # PATCH/PUT /mangements/1.json
  def update
    if @mangement.update(mangement_params)
      if @mangement.temporary_flag == true
        @mangement.update(temporary_flag: false)
      end
      ApplicationMailer.update_user_info(@mangement).deliver_now
      redirect_to @mangement, notice: 'メールが送信されました'
    else
      render :edit
    end
  end

  # DELETE /mangements/1
  # DELETE /mangements/1.json
  def destroy
    @mangement.destroy
    redirect_to mangements_url, notice: '削除しました'
  end

  private

  def checked_user?
    redirect_to admin_login_path if session[:id].blank?
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_mangement
      @mangement = Mangement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mangement_params
      params.require(:mangement).permit(:user_name, :email, :password)
    end
end
