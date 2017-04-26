class MovieusController < ApplicationController
  before_action :set_movieu, only: [:show, :edit, :update, :destroy]

  # GET /movieus
  # GET /movieus.json
  def index
    @movieus = Movieu.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 7)
  end

  # GET /movieus/1
  # GET /movieus/1.json
  def show
    
  end

  # GET /movieus/new
  def new
    @movieu = Movieu.new
  end

  # GET /movieus/1/edit
  def edit
  end

  # POST /movieus
  # POST /movieus.json
  def create
    @movieu = Movieu.new(movieu_params)

    respond_to do |format|
      if @movieu.save
        format.html { redirect_to @movieu, notice: 'Movieu was successfully created.' }
        format.json { render :show, status: :created, location: @movieu }
      else
        format.html { render :new }
        format.json { render json: @movieu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movieus/1
  # PATCH/PUT /movieus/1.json
  def update
    respond_to do |format|
      if @movieu.update(movieu_params)
        format.html { redirect_to @movieu, notice: 'Movieu was successfully updated.' }
        format.json { render :show, status: :ok, location: @movieu }
      else
        format.html { render :edit }
        format.json { render json: @movieu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movieus/1
  # DELETE /movieus/1.json
  def destroy
    @movieu.destroy
    respond_to do |format|
      format.html { redirect_to movieus_url, notice: 'Movieu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movieu
      @movieu = Movieu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movieu_params
      params.require(:movieu).permit(:title, :gstream, :nstream, :lstream, :mstream)
    end
end
