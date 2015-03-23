class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]

  def index
    @countries = Country.all
  end

  def show
  end

  def new
    @country = Country.new
  end

  def edit
  end

  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        flash[:success] = 'Country was successfully created.'
        format.html { redirect_to @country }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @country.update(country_params)
        flash[:success] = 'Country was successfully updated.'
        format.html { redirect_to @country }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @country.destroy
    respond_to do |format|
      flash[:success] = 'Country was successfully destroyed.'
      format.html { redirect_to countries_url }
    end
  end

  private
    def set_country
      @country = Country.find(params[:id])
    end

    def country_params
      params.require(:country).permit(:name, :description, :flag)
    end
end
