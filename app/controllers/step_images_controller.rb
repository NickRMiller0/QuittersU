class StepImagesController < ApplicationController
  before_action :set_step_image, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /step_images
  # GET /step_images.json
  def index
    @step_images = current_user.step_images.all
  end

  # GET /step_images/1
  # GET /step_images/1.json
  def show
  end

  # GET /step_images/new
  def new
    @step_image = current_user.step_images.new
  end

  # GET /step_images/1/edit
  def edit
  end

  # POST /step_images
  # POST /step_images.json
  def create
    @step_image = current_user.step_images.new(step_image_params)

    respond_to do |format|
      if @step_image.save
        format.html { redirect_to Pin.find(StepImage.where(:id => @step_image).pluck(:pin_id).last), notice: 'Step image was successfully created.' }
        format.json { render action: 'show', status: :created, location: @step_image }
      else
        format.html { render action: 'new' }
        format.json { render json: @step_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /step_images/1
  # PATCH/PUT /step_images/1.json
  def update
    respond_to do |format|
      if @step_image.update(step_image_params)
        format.html { redirect_to @step_image, notice: 'Step image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @step_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /step_images/1
  # DELETE /step_images/1.json
  def destroy
    @step_image.destroy
    respond_to do |format|
      format.html { redirect_to step_images_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step_image
      @step_image = StepImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def step_image_params
      params.require(:step_image).permit(:pin_id, :step_id, :description, :image)
    end
end
