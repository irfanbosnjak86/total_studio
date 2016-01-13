class Admin::SlidersController < ApplicationController
before_action :find_slider, only: [:show, :edit, :update, :destroy]
before_action :authenticate_admin!, except: [:index]
layout "blog", except: [:index]

  def index
    @slider = Slider.last
    if @slider.present? 
      render 'index'
    else
      redirect_to new_slider_path
    end
  end 

  def show
  end

  def new
    current_admin
    @slider = Slider.new
    6.times { @slider.slider_images.build }
  end

  def create
    current_admin 
    @slider = Slider.new(slider_params)

    if @slider.save
      redirect_to ([ :admin, @slider ]), notice: "Uspesno kreiran Slider!"
    else
      render 'new'
    end
  end

  def update
    if @slider.update(slider_params)
      redirect_to ([ :admin, @slider ]), notice: "Uspesno editovan Slider"
    else
      render 'edit'
    end
  end

  def edit
    n = @slider.slider_images.count
    if n < 6 
      (6-n).times { @slider.slider_images.build }
    end  
  end

  def destroy
    @slider.destroy
    redirect_to sliders_path, notice: "Slider Uspesno Obrisan!"
  end

  private

  def slider_params
    params.require(:slider).permit( :admin_id, :slider_id, :slider_name, slider_images_attributes: [ :id, :simage_id, :image, :_destroy ] )
  end 

  def find_slider
    @slider = Slider.find(params[:id])
  end
end