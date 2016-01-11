class SlidersController < ApplicationController
  layout "application"
  
  def index
    @slider = Slider.find(2)
  end 
end
