class SlidersController < ApplicationController
  before_action :find_slider, only: [:show, :edit, :update, :destroy]
  layout "application"
  def index
    @slider = Slider.all
  end

  def show
  end

  def new
    @slider = Slider.new
  end

  def create 
    @slider = Slider.new(slider_params)
    if @slider.save
      redirect_to @slider, notice: "Uspesno kreiran Slider!"
    else
      render 'new'
    end
  end

  def update
    if @slider.update(slider_params)
      redirect_to @slider, notice: "Uspesno editovan Slider"
    else
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    @slider.destroy
    redirect_to sliders_path, notice: "Slider Uspesno Obrisan!"
  end

  private

  def slider_params
    params.require(:slider).permit( :slider_id, :slider_name, :image )
  end 

  def find_slider
    @slider = Slider.find(params[:id])
  end

end
