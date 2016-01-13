class SlidersController < ApplicationController
  layout "application"
  
  def index
    @slider = Slider.last
    if @slider.present? 
      render 'index'
    else
      redirect_to new_slider_path
    end
  end 
end
