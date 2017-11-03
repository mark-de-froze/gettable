class ReservationsController < ApplicationController
  before_action :set_restaurant_table
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /restaurants/1/tables/1/reservations
  # GET /restaurants/1/tables/1/reservations.json
  def index
    @reservations = @table.reservations.order(:starts_at)
  end

  # GET /restaurants/1/tables/1/reservations/1
  # GET /restaurants/1/tables/1/reservations/1.json
  def show
  end

  # GET /restaurants/1/tables/1/reservations/new
  def new
    @reservation = @table.reservations.build
    @reservation.build_visitor
  end

  # GET /restaurants/1/tables/1/reservations/1/edit
  def edit
  end

  # POST /restaurants/1/tables/1/reservations
  # POST /restaurants/1/tables/1/reservations.json
  def create
    @reservation = @table.reservations.build(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to [@restaurant, @table, @reservation], notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1/tables/1/reservations/1
  # PATCH/PUT /restaurants/1/tables/1/reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to [@restaurant, @table, @reservation], notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1/tables/1/reservations/1
  # DELETE /restaurants/1/tables/1/reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to [@restaurant, @table], notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant_table
    @restaurant = Restaurant.find(params[:restaurant_id])
    @table = @restaurant.tables.find(params[:table_id])
  end

  def set_reservation
    @reservation = @table.reservations.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reservation_params
    params.require(:reservation).permit(:table_id, :starts_at, :ends_at, visitor_attributes: [:id, :name, :phone, :note, :number_persons])
  end
end