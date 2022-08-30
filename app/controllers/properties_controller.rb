class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      flash[:success] = "Property successfully created"
      redirect_to @property
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:property, :rent, :address, :building_age, :remarks)
  end

end
