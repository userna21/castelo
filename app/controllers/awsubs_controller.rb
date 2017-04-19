class AwsubsController < ApplicationController
  before_action :set_awsub, only: [:show, :edit, :update, :destroy]

  # GET /awsubs
  # GET /awsubs.json
  def index
    # if params[:q].present?
    #   @awsubs = AwSearcher.new.call(params).awsubs
    # else
      @awsubs = Awsub.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    # end
  end

  # GET /awsubs/1
  # GET /awsubs/1.json
  def show
    @aimages = @awsub.aimages
  end

  # GET /awsubs/new
  def new
    @awsub = Awsub.new
  end

  # GET /awsubs/1/edit
  def edit
  end

  # POST /awsubs
  # POST /awsubs.json
  def create
    @awsub = Awsub.new(awsub_params)

    respond_to do |format|
      if @awsub.save
        format.html { redirect_to @awsub, notice: 'Awsub was successfully created.' }
        format.json { render :show, status: :created, location: @awsub }
      else
        format.html { render :new }
        format.json { render json: @awsub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /awsubs/1
  # PATCH/PUT /awsubs/1.json
  def update
    respond_to do |format|
      if @awsub.update(awsub_params)
        format.html { redirect_to @awsub, notice: 'Awsub was successfully updated.' }
        format.json { render :show, status: :ok, location: @awsub }
      else
        format.html { render :edit }
        format.json { render json: @awsub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /awsubs/1
  # DELETE /awsubs/1.json
  def destroy
    @awsub.destroy
    respond_to do |format|
      format.html { redirect_to awsubs_url, notice: 'Awsub was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_awsub
      @awsub = Awsub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def awsub_params
      params.require(:awsub).permit(:title, :sinop, :asmall, :amedium)
    end
end
