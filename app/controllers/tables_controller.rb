class TablesController < ApplicationController
  before_action :set_restaurant
  before_action :set_table, only: [:show, :edit, :update, :destroy]

  # GET /restaurants/1/tables
  # GET /restaurants/1/tables.json
  def index
    @tables = @restaurant.tables
  end

  # GET /restaurants/1/tables/1
  # GET /restaurants/1/tables/1.json
  def show
  end

  # GET /restaurants/1/tables/new
  def new
    @table = @restaurant.tables.build
  end

  # GET /restaurants/1/tables/1/edit
  def edit
  end

  # POST /restaurants//tables
  # POST /restaurants/1/tables.json
  def create
    @table = @restaurant.tables.build(table_params)

    respond_to do |format|
      if @table.save
        format.html { redirect_to restaurant_tables_path(@restaurant), notice: 'Table was successfully created.' }
        format.json { render :show, status: :created, location: @table }
      else
        format.html { render :new }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1/tables/1
  # PATCH/PUT /restaurants/1/tables/1.json
  def update
    respond_to do |format|
      if @table.update(table_params)
        format.html { redirect_to restaurant_tables_path(@restaurant), notice: 'Table was successfully updated.' }
        format.json { render :show, status: :ok, location: @table }
      else
        format.html { render :edit }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1/tables/1
  # DELETE /restaurants/1/tables/1.json
  def destroy
    @table.destroy
    respond_to do |format|
      format.html { redirect_to tables_url, notice: 'Table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_table
    @table = @restaurant.tables.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def table_params
    params.require(:table).permit(:restaurant_id, :number_table)
  end
end
