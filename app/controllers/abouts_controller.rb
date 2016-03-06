class AboutsController < ApplicationController
  before_action :set_admin_about, only: [:show, :edit, :update, :destroy]

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_about
      @about = About.last
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def about_params
      params.require(:about).permit( :title, :description, :admin_id, :photo)
    end
end
