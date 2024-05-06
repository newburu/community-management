class UserStrengthsController < ApplicationController
  before_action :set_user_strength, only: %i[ show edit update destroy ]

  # GET /user_strengths or /user_strengths.json
  def index
    @user_strengths = UserStrength.all
  end

  # GET /user_strengths/1 or /user_strengths/1.json
  def show
  end

  # GET /user_strengths/new
  def new
    @user_strength = UserStrength.new
    @index = Time.now.to_i
  end

  # GET /user_strengths/1/edit
  def edit
  end

  # POST /user_strengths or /user_strengths.json
  def create
    @user_strength = UserStrength.new(strength_params)

    respond_to do |format|
      if @user_strength.save
        format.html { redirect_to user_strength_url(@user_strength), notice: "UserStrength was successfully created." }
        format.json { render :show, status: :created, location: @user_strength }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_strength.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_strengths/1 or /user_strengths/1.json
  def update
    respond_to do |format|
      if @user_strength.update(strength_params)
        format.html { redirect_to strength_url(@user_strength), notice: "UserStrength was successfully updated." }
        format.json { render :show, status: :ok, location: @user_strength }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_strength.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_strengths/1 or /user_strengths/1.json
  def destroy
    @user_strength.destroy!

    respond_to do |format|
      format.html { redirect_to user_strengths_url, notice: "UserStrength was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_strength
      @user_strength = UserStrength.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_strength_params
      params.require(:user_strength).permit(:no)
    end
end
