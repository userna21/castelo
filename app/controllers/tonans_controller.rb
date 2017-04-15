class TonansController < ApplicationController
  before_action :set_tonan, only: [:show, :edit, :update, :destroy]

  # GET /tonans
  # GET /tonans.json
  def index
    @tonans = Tonan.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  # GET /tonans/1
  # GET /tonans/1.json
  def show
    @timages = @tonan.timages
  end

  # GET /tonans/new
  def new
    @tonan = Tonan.new
  end

  # GET /tonans/1/edit
  def edit
  end

  # POST /tonans
  # POST /tonans.json
  def create
    @tonan = Tonan.new(tonan_params)

    respond_to do |format|
      if @tonan.save
        format.html { redirect_to @tonan, notice: 'Tonan was successfully created.' }
        format.json { render :show, status: :created, location: @tonan }
      else
        format.html { render :new }
        format.json { render json: @tonan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tonans/1
  # PATCH/PUT /tonans/1.json
  def update
    respond_to do |format|
      if @tonan.update(tonan_params)
        format.html { redirect_to @tonan, notice: 'Tonan was successfully updated.' }
        format.json { render :show, status: :ok, location: @tonan }
      else
        format.html { render :edit }
        format.json { render json: @tonan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tonans/1
  # DELETE /tonans/1.json
  def destroy
    @tonan.destroy
    respond_to do |format|
      format.html { redirect_to tonans_url, notice: 'Tonan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tonan
      @tonan = Tonan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tonan_params
      params.require(:tonan).permit(:title, :sinop, :small, :medium)
    end
end
