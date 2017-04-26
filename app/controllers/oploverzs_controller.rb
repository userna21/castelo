class OploverzsController < ApplicationController
  before_action :set_oploverz, only: [:show, :edit, :update, :destroy]

  # GET /oploverzs
  # GET /oploverzs.json
  def index
    # if params[:q].present?
    #   @oploverzs = OpSearcher.new.call(params).oploverzs
    # else
      @oploverzs = Oploverz.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 7)
    # end
  end

  # GET /oploverzs/1
  # GET /oploverzs/1.json
  def show
    @ostreams = @oploverz.ostreams
  end

  # GET /oploverzs/new
  def new
    @oploverz = Oploverz.new
  end

  # GET /oploverzs/1/edit
  def edit
  end

  # POST /oploverzs
  # POST /oploverzs.json
  def create
    @oploverz = Oploverz.new(oploverz_params)

    respond_to do |format|
      if @oploverz.save
        format.html { redirect_to @oploverz, notice: 'Oploverz was successfully created.' }
        format.json { render :show, status: :created, location: @oploverz }
      else
        format.html { render :new }
        format.json { render json: @oploverz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oploverzs/1
  # PATCH/PUT /oploverzs/1.json
  def update
    respond_to do |format|
      if @oploverz.update(oploverz_params)
        format.html { redirect_to @oploverz, notice: 'Oploverz was successfully updated.' }
        format.json { render :show, status: :ok, location: @oploverz }
      else
        format.html { render :edit }
        format.json { render json: @oploverz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oploverzs/1
  # DELETE /oploverzs/1.json
  def destroy
    @oploverz.destroy
    respond_to do |format|
      format.html { redirect_to oploverzs_url, notice: 'Oploverz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oploverz
      @oploverz = Oploverz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def oploverz_params
      params.require(:oploverz).permit(:title, :sinops, :small, :medium)
    end
end
