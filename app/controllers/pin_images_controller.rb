class PinImagesController < ApplicationController
  before_action :set_pin_image, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  # GET /pin_images
  # GET /pin_images.json
  def index
    @pin_images = current_user.pin_images.all
  end

  # GET /pin_images/1
  # GET /pin_images/1.json
  def show
  end

  # GET /pin_images/new
  def new
    @pin_image = current_user.pin_images.new
  end

  # GET /pin_images/1/edit
  def edit
  end

  # POST /pin_images
  # POST /pin_images.json
  def create
    @pin_image = current_user.pin_images.new(params[:pin_image])

    respond_to do |format|
      if @pin_image.save
        format.html { redirect_to Pin.find(PinImage.where(:id => @pin_image).pluck(:pin_id).last), notice: 'Pin image was successfully created.' }
        format.json { render json: @pin_image, status: :created, location: @pin_image }
      else
        format.html { render action: 'new' }
        format.json { render json: @pin_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pin_images/1
  # PATCH/PUT /pin_images/1.json
  def update
    respond_to do |format|
      if @pin_image.update(pin_image_params)
        format.html { redirect_to @pin_image, notice: 'Pin image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pin_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pin_images/1
  # DELETE /pin_images/1.json
  def destroy
    @pin_image.destroy
    respond_to do |format|
      format.html { redirect_to pin_images_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin_image
      @pin_image = PinImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_image_params
      params.require(:pin_image).permit(:pin_id, :description, :image)
    end
end
