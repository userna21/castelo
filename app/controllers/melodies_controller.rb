class MelodiesController < ApplicationController
  before_action :set_melody, only: [:show, :edit, :update, :destroy]

  # GET /melodies
  # GET /melodies.json
  def index
    # if params[:q].present?
    #   @melodies = MeloSearcher.new.call(params).melodies
    # else
      @melodies = Melody.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    # end
  end

  # GET /melodies/1
  # GET /melodies/1.json
  def show
    @mimages = @melody.mimages
  end

  # GET /melodies/new
  def new
    @melody = Melody.new
  end

  # GET /melodies/1/edit
  def edit
  end

  # POST /melodies
  # POST /melodies.json
  def create
    @melody = Melody.new(melody_params)

    respond_to do |format|
      if @melody.save
        format.html { redirect_to @melody, notice: 'Melody was successfully created.' }
        format.json { render :show, status: :created, location: @melody }
      else
        format.html { render :new }
        format.json { render json: @melody.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /melodies/1
  # PATCH/PUT /melodies/1.json
  def update
    respond_to do |format|
      if @melody.update(melody_params)
        format.html { redirect_to @melody, notice: 'Melody was successfully updated.' }
        format.json { render :show, status: :ok, location: @melody }
      else
        format.html { render :edit }
        format.json { render json: @melody.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /melodies/1
  # DELETE /melodies/1.json
  def destroy
    @melody.destroy
    respond_to do |format|
      format.html { redirect_to melodies_url, notice: 'Melody was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_melody
      @melody = Melody.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def melody_params
      params.require(:melody).permit(:mtitle, :msinop, :msmall, :mmedium)
    end
end
