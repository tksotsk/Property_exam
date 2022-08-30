class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
    @property.nearest_stations.new
  end

  def create
    @property = Property.new(property_params)
    @property.nearest_stations.each do |v|
      v.delete if v.station_name.blank?
    end
    if @property.save
      flash[:success] = "新しい物件が作成されました"
      redirect_to @property
    else
      flash[:error] = ""
      render 'new'
    end
  end
  
  def show
    @nearest_stations = NearestStation.where(property_id: @property.id)
  end

  def edit
    @nearest_stations = NearestStation.where(property_id: @property.id)
    @property.nearest_stations.new
  end

  def update
    @nearest_stations = NearestStation.where(property_id: @property.id)
    
    if @property.update(property_params)
      flash[:success] = "物件が編巣されました"
      redirect_to @property
    else
      flash[:error] = ""
      render 'edit'
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path, notice: "物件は削除されました"
  end

  private
  
  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:property, :rent, :address, :building_age, :remarks, nearest_stations_attributes: [:id, :name_of_railway, :station_name, :how_many_minites_walk])
  end

end
