class MembersController < ApplicationController
  before_action :set_member, only: %i[ show edit update destroy ]

  # GET /members or /members.json
  def index
    @members = User.all
  end
  
  # GET /members/1 or /members/1.json
  def show
  end

  # GET /members/1/edit
  def edit
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user_community.update(member_params)
        format.html { redirect_to community_member_url(@user_community), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to members_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = User.find(params[:id])
      @user_community = UserCommunity.find_by(user: @member, community_id: params[:community_id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:user_community).permit(:name, :comment)
    end
end
