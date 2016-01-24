class SlidersController < ApplicationController
  layout "application"
  
  def index
    @slider = Slider.last
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(6)
    if @slider.present? 
      render 'index'
    else
      redirect_to new_slider_path
    end
  end 
end
