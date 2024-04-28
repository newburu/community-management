class CommunitiesController < ApplicationController
  before_action :set_community, only: %i[ show edit update destroy join ]

  # GET /communities or /communities.json
  def index
    @communities = Community.all
  end

  # GET /communities/1 or /communities/1.json
  def show
  end

  # GET /communities/new
  def new
    @community = Community.new(owner: current_user)
  end

  # GET /communities/1/edit
  def edit
  end

  # POST /communities or /communities.json
  def create
    @community = Community.new(community_params)

    respond_to do |format|
      if @community.save
        format.html { redirect_to community_url(@community), notice: "Community was successfully created." }
        format.json { render :show, status: :created, location: @community }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communities/1 or /communities/1.json
  def update
    respond_to do |format|
      if @community.update(community_params)
        format.html { redirect_to community_url(@community), notice: "Community was successfully updated." }
        format.json { render :show, status: :ok, location: @community }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/1 or /communities/1.json
  def destroy
    @community.destroy!

    respond_to do |format|
      format.html { redirect_to communities_url, notice: "Community was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def join
    @user_community = UserCommunity.find_or_initialize_by(user: current_user, community: @community, status: 0)
    respond_to do |format|
      if @user_community.save
        format.html { redirect_to community_url(@community), notice: "Community was successfully joined." }
        format.json { render :show, status: :ok, location: @community }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_community.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community
      @community = Community.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def community_params
      params.require(:community).permit(:owner_id, :name, :url, :icon, :comment)
    end
end
