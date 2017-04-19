class SamesController < ApplicationController
  before_action :set_same, only: [:show, :edit, :update, :destroy]

  # GET /sames
  # GET /sames.json
  def index
    # if params[:q].present?
    #   @sames = SameSearcher.new.call(params).sames
    # else
      @sames = Same.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    # end
  end

  # GET /sames/1
  # GET /sames/1.json
  def show
    @limages = @same.limages
  end

  # GET /sames/new
  def new
    @same = Same.new
  end

  # GET /sames/1/edit
  def edit
  end

  # POST /sames
  # POST /sames.json
  def create
    @same = Same.new(same_params)

    respond_to do |format|
      if @same.save
        format.html { redirect_to @same, notice: 'Same was successfully created.' }
        format.json { render :show, status: :created, location: @same }
      else
        format.html { render :new }
        format.json { render json: @same.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sames/1
  # PATCH/PUT /sames/1.json
  def update
    respond_to do |format|
      if @same.update(same_params)
        format.html { redirect_to @same, notice: 'Same was successfully updated.' }
        format.json { render :show, status: :ok, location: @same }
      else
        format.html { render :edit }
        format.json { render json: @same.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sames/1
  # DELETE /sames/1.json
  def destroy
    @same.destroy
    respond_to do |format|
      format.html { redirect_to sames_url, notice: 'Same was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_same
      @same = Same.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def same_params
      params.require(:same).permit(:title, :lsmall1, :lsmall2, :lmedium1, :lmedium2)
    end
end
