class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  # GET /hotels
  # GET /hotels.json
  def index
    @hotels = if current_user
                Hotel.all
              else
                Hotel.includes(:room_types).where(room_types: {available: true})
              end
  end

  # GET /hotels/1
  # GET /hotels/1.json
  def show
  end

  # GET /hotels/new
  def new
    @hotel = Hotel.new
    @hotel.room_types.presence || @hotel.room_types.build
  end

  # GET /hotels/1/edit
  def edit
    @hotel.room_types.presence || @hotel.room_types.build
  end

  # POST /hotels
  # POST /hotels.json
  def create
    @hotel = Hotel.new(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to @hotel, notice: 'Hotel was successfully created.' }
        format.json { render :show, status: :created, location: @hotel }
      else
        format.html { render :new }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotels/1
  # PATCH/PUT /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to @hotel, notice: 'Hotel was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to hotels_url, notice: 'Hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hotel_params
      params.require(:hotel).permit(:name, :location, room_types_attributes: [:name,:available, :hotel_id, :id])
    end
end
