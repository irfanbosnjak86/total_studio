class SlidersController < ApplicationController
  before_action :find_slider, only: [:show, :edit, :update, :destroy]
  layout "application"
  def index
    @slider = Slider.find(2)
  end 
end
