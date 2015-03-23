class CitiesController < ApplicationController
  before_action :set_country
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  def index
    @cities = @country.cities
  end

  def show
  end

  def new
    @city = City.new
  end

  def edit
  end

  def create
    @city = City.new(city_params)
    @city.country_id = @country.id
    respond_to do |format|
      if @city.save
        format.html { redirect_to country_city_path(@country, @city) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to country_city_path(@country, @city) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to country_city_url, notice: 'City was successfully destroyed.' }
    end
  end

  private
    def set_country
      @country = Country.find(params[:country_id])
    end

    def set_city
      @city = @country.cities.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name)
    end
end
